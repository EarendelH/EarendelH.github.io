# Ziheng Wang — Academic Homepage

Personal academic website built with [Academic Pages](https://github.com/academicpages/academicpages.github.io), Jekyll, and GitHub Pages.

## Local development

```bash
gem install bundler
bundle install
bundle exec jekyll serve --livereload --config _config.yml,_config_dev.yml
```

Open `http://localhost:4000`. Run `bundle exec jekyll build` for a production build in `_site/`.

After a production build, run `bundle exec ruby scripts/check_site.rb` to validate internal links, publication count, archive integrity, and privacy filters.

## Content

- `_pages/about.md` — homepage
- `_pages/cv.md` — education, internships, research, competitions, and skills
- `_publications/` — formally published papers only
- `archive/legacy-blog/` — unpublished legacy blog archive (19 posts and associated media)

The legacy blog is intentionally excluded from Jekyll output. Its sources and media remain versioned for future restoration.

Deployment runs through `.github/workflows/pages.yml` after changes reach the repository's `hexo` source branch. Before the first deployment, select **GitHub Actions** under **Settings → Pages → Build and deployment → Source**. The source CV is intentionally ignored and excluded from the generated website because it contains private contact information and non-public manuscripts.
