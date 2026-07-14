#!/usr/bin/env ruby

require "cgi"
require "nokogiri"
require "pathname"
require "uri"

ROOT = Pathname.new(File.expand_path("..", __dir__))
SITE = ROOT.join("_site")
BLOG_ARCHIVE = ROOT.join("archive", "legacy-blog")
SITE_HOST = "earendelh.github.io"

abort("Run `bundle exec jekyll build` first.") unless SITE.directory?

errors = []
html_files = Dir.glob(SITE.join("**", "*.html"))

html_files.each do |file|
  document = Nokogiri::HTML(File.read(file, encoding: "UTF-8"))
  document.css("[href], [src]").each do |node|
    raw = node["href"] || node["src"]
    next if raw.nil? || raw.empty? || raw.start_with?("#", "mailto:", "tel:", "javascript:", "data:", "//")

    clean_path = raw
    if (match = raw.match(%r{\Ahttps?://([^/]+)(/.*)?\z}i))
      next if match[1] != SITE_HOST
      clean_path = match[2] || "/"
    elsif raw.match?(%r{\A[a-z][a-z0-9+.-]*:}i)
      next
    end

    clean_path = clean_path.split("#", 2).first.split("?", 2).first
    next if clean_path.empty?
    decoded_path = CGI.unescape(clean_path)
    target = if decoded_path.start_with?("/")
               SITE.join(decoded_path.delete_prefix("/"))
             else
               Pathname.new(File.expand_path(decoded_path, File.dirname(file)))
             end
    target = target.join("index.html") if decoded_path.end_with?("/") || target.directory?

    unless target.to_s.start_with?(SITE.to_s) && target.file?
      errors << "Missing local target in #{file}: #{raw}"
    end
  end
end

forbidden = [
  "15387336093",
  "12310401@mail.sustech.edu.cn",
  "3.79 / 4.0",
  "3.79/4.0",
  "90.65/100",
  "GPA at SUSTech",
  "GLARE: Generalizable Large-scale Analog Sizing",
  "Reinforcement Learning with Group Relative Policy Optimization for Fast Analog-LDO Sizing",
  "Physics-Informed Hybrid Modeling and Model Predictive Control for Energy-Efficient Building HVAC Systems",
  "Design Intent Driven Multi-Agent Reinforcement Learning With Current-Transient Automatic Clustering"
]

site_text = html_files.map { |file| File.read(file, encoding: "UTF-8") }.join("\n")
visible_site_text = html_files.map do |file|
  Nokogiri::HTML(File.read(file, encoding: "UTF-8")).text
end.join("\n")
forbidden.each do |text|
  errors << "Forbidden private or non-public content found: #{text}" if site_text.include?(text)
end

public_email = "wangziheng2023@mail.sustech.edu.cn"
errors << "Public email is not visibly rendered." unless visible_site_text.include?(public_email)
errors << "CV page was not rendered." unless SITE.join("cv", "index.html").file?
errors << "Retired Experience page was rendered." if SITE.join("experience", "index.html").file?
errors << "Generated HTML still links to /experience/." if site_text.include?("/experience/")

if SITE.join("cv", "index.html").file?
  cv_text = Nokogiri::HTML(File.read(SITE.join("cv", "index.html"), encoding: "UTF-8")).text
  %w[Education Internships Research Competitions].each do |heading|
    errors << "CV is missing the #{heading} section." unless cv_text.include?(heading)
  end
end

rendered_blog_files = Dir.glob(SITE.join("blog", "**", "*")).select { |path| File.file?(path) }
errors << "Archived blog content was rendered: #{rendered_blog_files.first}" unless rendered_blog_files.empty?
errors << "Public blog index was rendered." if SITE.join("blog", "index.html").file?
%w[archive categories tags archives].each do |directory|
  errors << "Blog-only output directory was rendered: #{directory}." if SITE.join(directory).directory?
end
errors << "Generated HTML still links to the archived blog." if site_text.include?("/blog/")

archived_posts = Dir.glob(BLOG_ARCHIVE.join("_posts", "*.md"))
archived_media = Dir.glob(BLOG_ARCHIVE.join("images", "blog", "**", "*")).select { |path| File.file?(path) }
errors << "Expected 19 archived blog posts, found #{archived_posts.length}." unless archived_posts.length == 19
errors << "Expected 207 archived media files, found #{archived_media.length}." unless archived_media.length == 207
errors << "Published _posts directory is not empty." unless Dir.glob(ROOT.join("_posts", "*")).empty?

feed_path = SITE.join("feed.xml")
if feed_path.file?
  feed = Nokogiri::XML(File.read(feed_path, encoding: "UTF-8"))
  errors << "Archived posts appeared in feed.xml." unless feed.xpath("//*[local-name()='entry']").empty?
end

errors << "Expected 2 publications, found #{Dir.glob(SITE.join('publication', '*', 'index.html')).length}." unless Dir.glob(SITE.join("publication", "*", "index.html")).length == 2

if errors.empty?
  puts "Site checks passed: #{html_files.length} HTML pages, CV and public email rendered, no public blog, 2 publications; archive retains 19 posts and 207 media files."
else
  warn errors.join("\n")
  exit 1
end
