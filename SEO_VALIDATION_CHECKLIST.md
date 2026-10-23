# SEO validation checklist

**Local validation date:** 2026-10-23
**Deployment status:** Not deployed.

## Completed

- [x] Confirmed the project is a static HTML/CSS/JavaScript site with Vercel configuration.
- [x] Checked all nine local HTML pages for exactly one title, meta description, canonical URL, and H1.
- [x] Confirmed canonical URLs use `https://www.priodentim.com/` and clean paths.
- [x] Parsed all five embedded JSON-LD blocks successfully.
- [x] Parsed `sitemap.xml`; confirmed it contains nine URLs, all on the preferred host.
- [x] Confirmed `robots.txt` allows crawling and points to `https://www.priodentim.com/sitemap.xml`.
- [x] Checked local IDs for duplicates and local page/image references, resolving Vercel extensionless routes to their `.html` source pages for the check.
- [x] Verified local `href`/`src` targets, same-page and internal-page fragments, and image `alt` attributes across all nine HTML files.
- [x] Confirmed one `DOCTYPE`, `html`, `head`, and `body` wrapper in each HTML page.
- [x] Confirmed no local numeric price/savings claims or review/rating schema remain in the key commercial pages.
- [x] Browser spot-check at 375px on the homepage and representative product/commercial pages found no horizontal overflow or broken images; all 14 homepage images decoded when lazy loading was forced for the check.
- [x] Browser spot-check at 1280px on the homepage found no horizontal overflow. A local homepage reload recorded no console or page errors.
- [x] Tested the mobile menu with pointer/keyboard interaction: `aria-expanded` tracks the open state, the menu opens, and following a menu link closes it.
- [x] HEAD-checked both existing ClickBank affiliate URLs; each returned HTTP 307 to the seller FAQ URL with the same affiliate identifier. Link targets were preserved and affiliate `rel` attributes remain present.
- [x] Scanned 21 text-based source files with `scripts/audit-encoding.ps1`: all are valid UTF-8; zero confirmed mojibake, replacement characters, suspicious prefixes, or double-escaped numeric entities remain.
- [x] Confirmed all nine HTML documents declare UTF-8 as the first element inside `<head>`. Eight retain a valid UTF-8 BOM; the audit reports those as informational only.
- [x] Confirmed the live Vercel homepage response uses `Content-Type: text/html; charset=utf-8`; the local deployment configuration does not override response headers.
- [x] Reviewed valid Unicode punctuation restored in the research headings/captions and product artwork captions; intended meaning and scientific names are unchanged.
- [x] No package manifest or configured lint/build/test runner was found. The project is a Git repository; the focused static and browser checks above were used instead.

## Not completed / owner action

- [ ] Deploy the local changes through the approved Vercel release process. No post-change production deployment or crawl was performed.
- [ ] Recheck all production canonical and legacy redirects, status codes, internal links, affiliate destination, sitemap fetch, and robots fetch after deployment.
- [ ] Run Google Rich Results Test and Schema.org Validator against production-rendered URLs.
- [ ] Run Lighthouse or Web Vitals field/lab measurement on production; the local spot-check does not establish CWV performance.
- [ ] Complete keyboard/screen-reader accessibility checks and test the full page set at desktop and mobile sizes.
- [ ] Obtain current package labels and written seller documentation for formula/strains, warnings, manufacturing/certification, price, shipping, billing, package contents, bonuses, and all refund conditions.
- [ ] Add and test a monitored public contact email for website and privacy inquiries; no verified address was present in the project.
- [ ] Verify each linked research paper and its in-page summary against the actual publication.
- [ ] Use Search Console or another first-party query source to measure candidate keyword demand and performance; no search-volume figures were available in this audit.
