---
title: "Sitemap"
permalink: /sitemap/
author_profile: false
---

## Main pages

- [Home]({{ '/' | relative_url }})
- [Publications]({{ '/publications/' | relative_url }})
- [Experience]({{ '/experience/' | relative_url }})
- [Blog]({{ '/blog/' | relative_url }})
- [Posts by category]({{ '/categories/' | relative_url }})
- [Posts by tag]({{ '/tags/' | relative_url }})

## Blog posts

{% for post in site.posts %}
- [{{ post.title }}]({{ post.url | relative_url }}) — {{ post.date | date: "%Y-%m-%d" }}
{% endfor %}

