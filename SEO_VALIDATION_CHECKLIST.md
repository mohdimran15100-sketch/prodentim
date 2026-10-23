# SEO validation checklist

**Local validation date:** 2026-10-23
**GitHub status:** Current follow-up changes are committed and pushed to `origin/main`.
**Production status:** `www` endpoints checked; apex still returns HTTP 307. No manual deployment was performed.

## Completed

- [x] Confirmed the project is a static HTML/CSS/JavaScript site with Vercel configuration.
- [x] Checked all nine local HTML pages for exactly one title, meta description, canonical URL, and H1.
- [x] Confirmed canonical URLs use `https://www.priodentim.com/` and clean paths.
- [x] Parsed all five embedded JSON-LD blocks successfully.
- [x] Removed homepage Product markup lacking verified Offer/review/rating data; homepage structured data now uses WebSite, WebPage, and Organization without an incomplete Product entity.
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
- [x] Added an explicit Vercel host-conditional permanent redirect from `priodentim.com/*` to the matching `www.priodentim.com/*` canonical URL and pointed legacy page aliases directly to clean `www` URLs.
- [x] Production HTTP checks on 2026-10-23: `www` homepage and `/prodentim` return HTTP 200; homepage canonical points to `https://www.priodentim.com/`; `robots.txt` and `sitemap.xml` return HTTP 200.
- [x] Confirmed the GitHub `main` branch and local `HEAD` both point to `ec073d58b5572f49ff3d7fa8db4fc000f421b1e8`.
- [x] Production apex homepage and `/prodentim` currently redirect with HTTP 307 to the corresponding `www` URLs; this is recorded as unresolved rather than treated as a permanent redirect fix.
- [x] No package manifest or configured lint/build/test runner was found. The project is a Git repository; the focused static and browser checks above were used instead.
- [x] Reviewed page-specific metadata intent and aligned Open Graph/Twitter/WebPage descriptions on updated commercial/editorial pages.
- [x] Added concise visible answers for current ProDentim price and possible recurring billing without inventing offer amounts or terms.
- [x] Expanded keyword intent mapping while keeping pricing, editorial review, ingredient/use and research intent on distinct pages/sections to avoid keyword cannibalization.
- [x] Added a root IndexNow key file and a host-validated submission script for changed canonical URLs. Script receipt is not an indexing guarantee.
- [x] Checked the live seller FAQ and ADA home-care reference; retained seller attribution and did not turn ingredient/category research into product-specific medical claims.
- [x] Refused artificial backlink creation; no spam links or unsupported ranking claims were introduced.

## Not completed / owner action

- [ ] Confirm the active Vercel deployment corresponds to the pushed `main` commit. No manual deployment was performed.
- [ ] Inspect Vercel Project Settings → Domains: the current apex-to-`www` HTTP 307 appears to be applied before the project redirect rule. Configure a permanent redirect if available, then verify apex requests return HTTP 308 to the matching `www` path. The project cannot change an overriding Vercel domain-level redirect.
- [ ] In Search Console URL Inspection, inspect the exact reported URL and Google's selected canonical. The exact reported URL was not available; request indexing only for the canonical URL if inspection shows that is appropriate.
- [ ] Run Google Rich Results Test and Schema.org Validator against production-rendered URLs.
- [ ] After the updated homepage is deployed and recrawled, validate it in Search Console's Product snippets report and request validation if the issue remains. Use URL Inspection separately to diagnose indexing; structured-data rich-result warnings do not, by themselves, prevent indexing.
- [ ] Run Lighthouse or Web Vitals field/lab measurement on production; the local spot-check does not establish CWV performance.
- [ ] Complete keyboard/screen-reader accessibility checks and test the full page set at desktop and mobile sizes.
- [ ] Obtain current package labels and written seller documentation for formula/strains, warnings, manufacturing/certification, price, shipping, billing, package contents, bonuses, and all refund conditions.
- [ ] Add and test a monitored public contact email for website and privacy inquiries; no verified address was present in the project.
- [ ] Verify each linked research paper and its in-page summary against the actual publication.
- [ ] Use Search Console or another first-party query source to measure candidate keyword demand and performance; no search-volume figures were available in this audit.
- [ ] After deployment, verify the IndexNow key text is served at the canonical `www` root, then submit changed canonical URLs with `scripts/submit-indexnow.ps1`.
- [ ] Submit or refresh the XML sitemap in Google Search Console and Bing Webmaster Tools. Google indexing requests require an authenticated Search Console user; no ranking, indexing date, or outcome can be guaranteed.
- [ ] Review actual Google and Bing impressions/queries after data collection; no live search-result snapshot or verified competitor ranking data was available for this work.
