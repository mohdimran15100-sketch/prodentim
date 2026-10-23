# SEO validation checklist

**Local validation date:** 2026-11-29  
**Deployment status:** Not deployed.

## Completed

- [x] Confirmed the project is a static HTML/CSS/JavaScript site with Vercel configuration.
- [x] Checked all nine local HTML pages for exactly one title, meta description, canonical URL, and H1.
- [x] Confirmed canonical URLs use `https://www.priodentim.com/` and clean paths.
- [x] Parsed all five embedded JSON-LD blocks successfully.
- [x] Parsed `sitemap.xml`; confirmed it contains nine URLs, all on the preferred host.
- [x] Confirmed `robots.txt` allows crawling and points to `https://www.priodentim.com/sitemap.xml`.
- [x] Checked local IDs for duplicates and local page/image references, resolving Vercel extensionless routes to their `.html` source pages for the check.
- [x] Confirmed one `DOCTYPE`, `html`, `head`, and `body` wrapper in each HTML page.
- [x] Confirmed no local numeric price/savings claims or review/rating schema remain in the key commercial pages.
- [x] Browser preview of the homepage at 375px width: no horizontal body overflow; all 14 homepage images loaded.
- [x] Preserved affiliate link targets and `nofollow sponsored noopener` attributes. The existing affiliate destination had previously been checked and returned a successful seller-page response.
- [x] No package manifest, configured lint/build/test runner, or Git repository was present, so no npm build, automated test suite, or Git checkpoint was available.

## Not completed / owner action

- [ ] Deploy the local changes through the approved Vercel release process. The public site fetch still serves the previous deployed content.
- [ ] Recheck all production canonical and legacy redirects, status codes, internal links, affiliate redirect destination, sitemap fetch, and robots fetch after deployment.
- [ ] Run Google Rich Results Test and Schema.org Validator against production-rendered URLs.
- [ ] Run Lighthouse or Web Vitals field/lab measurement on production; the local spot-check does not establish CWV performance.
- [ ] Capture browser console errors, complete keyboard/screen-reader accessibility checks, and test the full page set at desktop and mobile sizes.
- [ ] Obtain current package labels and written seller documentation for formula/strains, warnings, manufacturing/certification, price, shipping, billing, package contents, bonuses, and all refund conditions.
- [ ] Add and test a monitored public contact email for website and privacy inquiries; no verified address was present in the project.
- [ ] Verify each linked research paper and its in-page summary against the actual publication.
- [ ] Use Search Console or another first-party query source to measure candidate keyword demand and performance; no search-volume figures were available in this audit.
