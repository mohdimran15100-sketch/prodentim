# SEO implementation report

**Updated:** 2026-10-23
**GitHub:** Changes pushed to `origin/main` at `ec073d58b5572f49ff3d7fa8db4fc000f421b1e8`.
**Deployment:** No manual deployment was performed. Production HTTP checks are recorded below; the apex-to-`www` permanent redirect is not yet confirmed live.

## Fixes implemented

- Standardized canonical, Open Graph, Twitter image, and structured-data URLs on the observed preferred `www` host and Vercel clean routes.
- Updated `robots.txt` and rebuilt the sitemap using those same canonical routes.
- Repaired homepage document/JSON-LD markup and removed unverified Product Offer price/availability. Later removed the remaining Product entity because it had no verified Offer, Review, or AggregateRating and triggered a Google Product rich-result issue. No price or rating was fabricated; visible product information remains on the page. This rich-result eligibility issue is separate from whether Google indexes the page.
- Removed unsupported testimonial portraits, star ratings, and customer quotations. Replaced them with an editorial evidence/verification note.
- Added a visible affiliate/editorial disclosure and publisher/credential transparency to primary editorial pages.
- Qualified product descriptions and directions as seller statements; identified supplied ingredient/package imagery as promotional artwork rather than a verified label.
- Removed named-strain, full-formula, and product-specific benefit claims where the seller FAQ did not substantiate them. Clarified the difference between ingredient-level research and evidence on the finished product.
- Removed unverified numeric package prices, totals, savings, package supply durations, bonus promises, and “best value/most popular” claims. Destination-specific shipping is shown only as a seller FAQ statement, not a current order quote; checkout pages direct readers to verify the final order summary.
- Rewrote refund copy to attribute the seller FAQ's 60-day/unused-product terms and instruct readers to verify current written conditions and costs.
- Replaced unsupported manufacturing, certification, batch-testing, and broad safety assertions with explicit evidence limitations.
- Added a visible complaints/side-effect limitation section to the editorial review.
- Removed the invalid contact-email placeholder; the contact page now makes clear that the site owner must supply a monitored address before publishing.
- Corrected the homepage JSON-LD syntax and removed FAQPage markup from pages whose visible answers had stale/unverified terms. Visible FAQs remain available to users.
- Normalized heading levels, removed the duplicate homepage FAQ anchor, and retained the existing site structure, supplied imagery, and affiliate destination links.
- Refreshed the shared visual system with a navy/blue/teal palette, responsive layout refinements, and reduced-motion support; corrected the homepage hamburger markup and mobile-menu ARIA state.
- Curated the homepage to eight selected oral-probiotic references and corrected statements about product-to-study matching.
- Replaced overconfident checkout, authenticity, support, privacy-cookie, and testimonial language with explicit limits and seller attribution.
- Replaced `llms.txt` with a concise account of the source and evidence limits rather than unsupported formula, manufacturing, and benefit claims.
- Updated this report set to distinguish completed local checks from follow-up checks and owner-side verification.
- Fixed confirmed text mojibake in research captions/headings and package-artwork separators; preserved intended em dashes, an arrow, and middle dots.
- Added a recursive UTF-8/mojibake audit script at `scripts/audit-encoding.ps1`. It validates strict UTF-8 bytes, HTML charset placement, common mojibake/replacement characters, and possible double-escaped numeric entities without rewriting source.
- Investigated the Search Console “Alternative page with proper canonical tag” report: on 2026-10-23, the live `www` homepage and `/prodentim` returned 200, the homepage declared the expected `www` canonical, and `robots.txt`/`sitemap.xml` returned 200. Apex requests still returned 307. Added and pushed a Vercel host-conditional permanent redirect to the preferred `www` host and made legacy page aliases point directly to their clean canonical URLs; the observed 307 indicates the project rule is not controlling the live apex redirect. Vercel domain-level settings need inspection.

## Exact files changed

1. `index.html`
2. `prodentim.html`
3. `buy-now.html`
4. `official-website.html`
5. `reviews.html`
6. `contact.html`
7. `disclaimer.html`
8. `privacy-policy.html`
9. `site.js`
10. `styles.css`
11. `llms.txt`
12. `KEYWORD_MAP.md`
13. `SEO_AUDIT.md`
14. `SEO_FIX_REPORT.md`
15. `SCHEMA_AUDIT.md`
16. `SEO_VALIDATION_CHECKLIST.md`
17. `scripts/audit-encoding.ps1`
18. `vercel.json`

The original SEO baseline was previously committed and pushed as `c8d34ac`. The follow-up encoding/canonical changes are pushed to `origin/main` at `ec073d58b5572f49ff3d7fa8db4fc000f421b1e8`.

## Remaining work for the site owner

- Confirm the current label/formula, all safety and manufacturing claims, price/stock, package contents, shipping, recurring billing, bonuses, and complete guarantee/return policy directly with authoritative seller documentation.
- Review each research citation and its summary against the linked publication before relying on it for editorial conclusions.
- In Vercel Project Settings → Domains, inspect the apex-to-`www` redirect and configure it to return a permanent redirect if Vercel's domain-level rule is taking precedence over `vercel.json`. Then verify apex requests return HTTP 308 and preserve the requested path; current production still returns 307.
- In Search Console URL Inspection, inspect the exact reported URL and Google's selected canonical. The exact affected URL is not available in this audit, and no indexing request was made.
- Confirm the deployed Vercel release corresponds to the pushed `main` commit, then crawl production URLs and confirm redirects, canonicals, visible copy, affiliate destinations, sitemap and robots behavior.
- Review analytics/Search Console query data before prioritizing keywords or making demand claims.
- Publish and test a monitored contact email for website/privacy inquiries; no verified address was available in the project.
