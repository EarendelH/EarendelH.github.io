# Ziheng Wang — Academic Homepage

Personal academic website and blog built with [Academic Pages](https://github.com/academicpages/academicpages.github.io), Jekyll, and GitHub Pages.

## Local development

```bash
gem install bundler
bundle install
bundle exec jekyll serve --livereload --config _config.yml,_config_dev.yml
```

Open `http://localhost:4000`. Run `bundle exec jekyll build` for a production build in `_site/`.

After a production build, run `bundle exec ruby scripts/check_site.rb` to validate internal links, media, publication count, and privacy filters.

## Content

- `_pages/about.md` — homepage
- `_pages/experience.md` — research, engineering, and competitions
- `_publications/` — formally published papers only
- `_posts/` — migrated blog posts
- `images/blog/` — blog media

Deployment runs through `.github/workflows/pages.yml` after changes reach the repository's `hexo` source branch. Before the first deployment, select **GitHub Actions** under **Settings → Pages → Build and deployment → Source**. The source CV is intentionally ignored and excluded from the generated website because it contains private contact information and non-public manuscripts.
