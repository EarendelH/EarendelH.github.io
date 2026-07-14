# Repository Guidelines

## Project Structure & Module Organization

This is a Jekyll academic site based on Academic Pages. Standalone content lives in `_pages/`: `about.md` is the homepage, while `experience.md`, `publications.html`, and `blog.html` provide the main sections. Published papers are individual records in `_publications/`. Blog posts live in `_posts/` and must use `YYYY-MM-DD-descriptive-slug.md` filenames. Store post media under `images/blog/<post-slug>/` and shared images directly under `images/`.

Theme templates are in `_layouts/` and `_includes/`; Sass sources are in `_sass/`, with the entry point at `assets/css/main.scss`. Site identity, collections, plugins, and author links are configured in `_config.yml`. Navigation order is controlled by `_data/navigation.yml`.

## Build, Test, and Development Commands

- `bundle install` installs the Ruby dependencies from `Gemfile` and `Gemfile.lock`.
- `bundle exec jekyll serve --livereload --config _config.yml,_config_dev.yml` serves the site at `http://localhost:4000` and rebuilds edited content.
- `bundle exec jekyll build` creates the production site in `_site/`.
- `bundle exec ruby scripts/check_site.rb` validates generated links, media, publication count, and privacy filters.
- `npm run build:js` rebuilds `assets/js/main.min.js` only after JavaScript source changes.

GitHub Actions builds pull requests and deploys the current `hexo` source branch through `.github/workflows/pages.yml`.

## Coding Style & Naming Conventions

Use two-space indentation in YAML and front matter. Quote titles containing punctuation, and keep permalinks lowercase and stable. Prefer Markdown for prose, semantic HTML for custom homepage components, and SCSS variables/CSS custom properties for colors. Add site-specific styles to `_sass/_custom.scss`; avoid editing vendored files unless updating the upstream theme.

## Testing Guidelines

There is no unit-test suite or coverage target. Every change must pass `bundle exec jekyll build` without warnings or errors. Preview all changed routes locally and check mobile layout, light/dark modes, image paths, links, syntax highlighting, and MathJax rendering. For migrated posts, verify each local image exists under `images/blog/`.

## Commit & Pull Request Guidelines

History favors short, direct subjects such as `update friends` and `theme rebuild`. Use an imperative, scoped subject such as `refresh publications page`, and keep commits focused. Pull requests should summarize affected routes, list build/preview checks, link relevant issues, and include screenshots for visible changes.

Only formally published work belongs in `_publications/`; do not add submissions under review or revision. Never commit phone numbers, private keys, generated `_site/` output, or `Ziheng Wang CV.pdf`.
