# ProDentim SEO and trust audit

**Audit date:** 2026-11-29  
**Target market:** United States  
**Project:** Static HTML/CSS/JavaScript website deployed with Vercel.

## Scope and evidence

Reviewed the nine public HTML pages, shared styles and script references, image paths, page metadata, embedded JSON-LD, `robots.txt`, `sitemap.xml`, and `vercel.json`. The site has no dependency manifest, configured test runner, or Git repository in the inspected project directory.

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
11. **Unusable contact placeholder:** The contact page displayed `[email protected]`, which is not a verified operational address.

## Technical observations

- Vercel configuration has `cleanUrls: true` and legacy-path redirects. Current canonicals and sitemap entries use `https://www.priodentim.com/` with clean page paths.
- `robots.txt` allows crawling and references the sitemap on the preferred host. No blocking directive was warranted.
- The current affiliate URL resolves through ClickBank to the seller flow; prior audit testing returned a successful destination response. Affiliate links remain tagged `rel="nofollow sponsored noopener"`.
- Important content is in static HTML. No client-side rendering dependency was found for the main page content.
- Local static validation found one title, description, canonical, and H1 per HTML page; one document wrapper per page; no duplicate IDs; all embedded JSON-LD parses; and local assets/page references resolve when Vercel clean routes are mapped to their `.html` source files.
- Local homepage browser preview at a 375px viewport had no horizontal overflow and all 14 images reported loaded. This is a browser spot-check, not a Core Web Vitals measurement.

## Limits and manual verification

- Current package label, complete formula, strain names, ingredient amounts, allergens, safety profile, manufacturing claims, and batch testing remain unverified. Product artwork must not be treated as label evidence.
- Current checkout price, inventory, selected-package shipping, subscription/renewal terms, bonuses, and final refund mechanics require a fresh manual check in the retailer checkout.
- The seller FAQ lists free U.S. shipping and a 60-day unused-product return; confirm both apply to the specific live offer and destination.
- A public-site fetch after the local edits still showed the prior deployed page content. No deployment was performed; local changes will not appear live until the site owner deploys them.
- No formal HTML conformance service, Schema.org validator, accessibility audit, browser console log capture, Lighthouse run, or production HTTP crawl was available in the local project validation.