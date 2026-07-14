#!/usr/bin/env ruby

require "cgi"
require "nokogiri"
require "pathname"
require "uri"

ROOT = Pathname.new(File.expand_path("..", __dir__))
SITE = ROOT.join("_site")
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
  "GLARE: Generalizable Large-scale Analog Sizing",
  "Reinforcement Learning with Group Relative Policy Optimization for Fast Analog-LDO Sizing",
  "Physics-Informed Hybrid Modeling and Model Predictive Control for Energy-Efficient Building HVAC Systems",
  "Design Intent Driven Multi-Agent Reinforcement Learning With Current-Transient Automatic Clustering"
]

site_text = html_files.map { |file| File.read(file, encoding: "UTF-8") }.join("\n")
forbidden.each do |text|
  errors << "Forbidden private or non-public content found: #{text}" if site_text.include?(text)
end

errors << "Expected 19 blog posts, found #{Dir.glob(SITE.join('blog', '20*', '**', 'index.html')).length}." unless Dir.glob(SITE.join("blog", "20*", "**", "index.html")).length == 19
errors << "Expected 2 publications, found #{Dir.glob(SITE.join('publication', '*', 'index.html')).length}." unless Dir.glob(SITE.join("publication", "*", "index.html")).length == 2

if errors.empty?
  puts "Site checks passed: #{html_files.length} HTML pages, 19 posts, 2 publications."
else
  warn errors.join("\n")
  exit 1
end
