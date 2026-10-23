# ProDentim SEO and trust audit

**Audit date:** 2026-10-23
**Target market:** United States  
**Project:** Static HTML/CSS/JavaScript website deployed with Vercel.

## Scope and evidence

Reviewed the nine public HTML pages, shared styles and script references, image paths, page metadata, embedded JSON-LD, `robots.txt`, `sitemap.xml`, and `vercel.json`. The project is a Git repository. It has no dependency manifest or configured build, lint, or test runner.

Live pages reviewed:

- `https://www.priodentim.com/` and the apex/clean-URL behavior recorded during the audit. The observed deployment redirects the apex host to `www`; Vercel `cleanUrls` serves extensionless page routes.
- `https://prodentim.com/text.php`, reached from the existing affiliate flow. Its public FAQ states a three-strain blend totaling 3.5 billion CFU, recommends slowly chewing a tablet each morning, describes a 60-day guarantee requiring return of unused product, and lists free U.S. shipping. It does not name the strains or provide a complete label in the content reviewed. Those are seller statements, not independently verified product facts; final order terms should be checked at checkout.
- `https://www.derilaergo.com/` as a general landing-page reference only. Its retrieved page presented grouped benefit/features content. No pillow-specific terms, claims, creative, testimonials, or product details were transferred to ProDentim.

No Search Console account, keyword research subscription, query report, ranking report, traffic analytics, or conversion data was available. No search volume, ranking, traffic, indexing, or competitor-performance claim is made.

## Confirmed issues in the local project before fixes

1. **Host/path inconsistency:** Canonical/social URLs and the XML sitemap used the apex host and `.html` routes despite the observed `www` preference and Vercel clean URLs.
2. **Malformed homepage structured data:** The homepage JSON-LD graph had invalid JSON. The graph also contained an unverified numeric Product Offer with price/availability; no verified price or stock evidence was available.
3. **Unsupported social proof:** The homepage presented customer-style testimonials, portraits, and five-star ratings without independently verifiable sources. This conflicted with the editorial review page's stated refusal to publish unverified reviews.
4. **Stale offer statements:** Local pages displayed specific package prices, savings, totals, free-shipping claims, bonus inclusions, supply durations, and unqualified refund language that could not be confirmed for the current order flow.
5. **Formula conflict:** Local promotional artwork and copy named conflicting probiotic strains, while the seller FAQ reviewed did not identify the strains or provide a complete ingredient panel.
6. **Unsubstantiated manufacturing/safety claims:** Some local copy asserted U.S. manufacture, GMP certification, FDA registration, batch testing, and broad safety. Documentation supporting those claims was not present in the reviewed source material.
7. **Overstated product benefits:** Some copy implied product-specific effects on oral bacterial balance, breath, gum comfort, or respiratory/immune outcomes based on studies of individual ingredients or strains.
8. **Metadata/content mismatch:** At least one public content page had duplicate or generic metadata before cleanup. Page descriptions and schema also reflected unverified strain claims.
9. **Homepage markup/content issues:** The source had extra document-wrapper closures and duplicate FAQ anchor IDs; several headings/sections presented formula and effect claims not supported by the accessible product FAQ.
10. **No quantitative keyword evidence:** Candidate query terms were supplied by the requester, but no measured demand data was available.
11. **No monitored contact method:** The project does not provide a verified website contact email or form; the site owner must publish and test one before inviting website or privacy inquiries.

## Technical observations

- Vercel configuration has `cleanUrls: true` and legacy-path redirects. Current canonicals and sitemap entries use `https://www.priodentim.com/` with clean page paths.
- `robots.txt` allows crawling and references the sitemap on the preferred host. No blocking directive was warranted.
- The two existing ClickBank affiliate URLs both returned HTTP 307 and a `Location` header to `https://prodentim.com/text.php` with the same affiliate `hop` identifier. Links remain tagged `rel="nofollow sponsored noopener"`; checkout contents and terms still require seller-side verification.
- Important content is in static HTML. No client-side rendering dependency was found for the main page content.
- Local static validation found one title, description, canonical, and H1 per HTML page; one document wrapper per page; no duplicate IDs; all embedded JSON-LD parses; and local assets/page references resolve when Vercel clean routes are mapped to their `.html` source files.
- Local homepage browser previews at 375px and 1280px viewports had no horizontal overflow; all 14 homepage images decoded successfully after lazy loading was forced for the check. This is a browser spot-check, not a Core Web Vitals measurement.

## Follow-up content and design work

- Replaced the monochrome/white presentation with a navy, blue, and teal visual system while retaining the existing page structure and assets.
- Updated mobile-menu ARIA state handling and added missing homepage menu-icon spans.
- Tightened buying, product, research, comparison, privacy, and contact copy to distinguish seller statements from verified facts and to avoid implying a verified checkout destination.
- Reduced the homepage research list to eight selected, oral-probiotic references, removing tangential studies; the citations and editorial summaries still require publication-level review.
- Updated the seller-attributed shipping table and promotional-artwork descriptions; these statements are not a verified checkout quote or offer.
- Corrected confirmed mojibake in visible research captions/headings and package-artwork separators; no source bytes were invalid UTF-8.
- Added a non-mutating recursive encoding audit. All 21 text source files pass strict UTF-8 validation; the nine HTML pages declare UTF-8 as the first `<head>` element. Eight HTML files use a valid UTF-8 BOM.

## Limits and manual verification

- Current package label, complete formula, strain names, ingredient amounts, allergens, safety profile, manufacturing claims, and batch testing remain unverified. Product artwork must not be treated as label evidence.
- Current checkout price, inventory, selected-package shipping, subscription/renewal terms, bonuses, and final refund mechanics require a fresh manual check in the retailer checkout.
- The seller FAQ lists free U.S. shipping and a 60-day unused-product return; confirm both apply to the specific live offer and destination.
- The last production-page fetch occurred before this follow-up implementation. No deployment or post-change production crawl was performed.
- A local homepage reload recorded no console or page errors. The mobile menu was spot-checked with pointer/keyboard interaction and its expanded state/close-on-link behavior. These are focused checks, not a full accessibility audit. No formal HTML conformance service, Schema.org validator, Lighthouse run, or production HTTP crawl was performed.
- The live homepage response was observed with `Content-Type: text/html; charset=utf-8`; `vercel.json` does not define custom response headers.