# Structured data audit

**Audit date:** 2026-10-23

## Before-and-after findings

- The homepage's original JSON-LD was malformed and contained an Offer with a numeric price and availability that were not verified from current checkout evidence.
- Several page graphs used apex-host `.html` URLs that did not match the observed preferred host and clean-route configuration.
- FAQPage entries on purchase/review pages included stale price, shipping, guarantee, manufacturing, strain, or product-effect claims. FAQ content remains visible, but unsupported rich-result markup was removed.
- No authentic, independently sourced review/rating set was available. No `Review` or `AggregateRating` schema is present.
- The homepage's informational `Product` entity had no verified `Offer`, `Review`, or `AggregateRating`, triggering Google's Product rich-result issue. Removed that entity rather than inventing commercial terms or customer ratings. Product information remains visible in page content.

## Current local graph inventory

| Page | Types present | Notes |
|---|---|---|
| `/` | `WebSite`, `WebPage`, `Organization` | No Product rich-result markup. The informational site does not have verified current offer details or independently sourced reviews/ratings to support Product rich-result properties. |
| `/prodentim` | `WebPage`, `BreadcrumbList` | Uses the preferred host and clean canonical route. |
| `/buy-now` | `WebPage`, `BreadcrumbList` | No offer/pricing schema; current amounts are checkout-dependent. |
| `/official-website` | `WebPage`, `BreadcrumbList` | No offer/pricing or FAQ rich-result markup. |
| `/reviews` | `WebPage`, `BreadcrumbList` | No review/rating markup and no FAQPage markup. |
| Legal/support pages | No JSON-LD | No additional schema was needed for these documents. |

## Validation

- Extracted all five JSON-LD script blocks from the local HTML source and parsed them with PowerShell `ConvertFrom-Json`: all five passed after the homepage repair.
- Confirmed the homepage JSON-LD contains no `Product` entity or dangling `#product` reference; no fabricated Offer, review, or rating was added.
- Parsed `sitemap.xml` as XML and checked all nine sitemap URLs use the preferred host.
- Checked canonical URLs, page URLs, and breadcrumb items for consistency with `vercel.json` clean URLs.
- This was local JSON parsing and manual graph inspection, not a response from the external Schema.org Validator or Google's Rich Results Test. Production-rendered structured data must be checked after deployment.

## Ongoing accuracy controls

- Do not add `Offer` until current price, currency, availability, and offer URL can be verified from the actual selected checkout.
- Do not add product `aggregateRating` or `Review` until authentic, representative, permissioned review data is available and visibly displayed.
- Do not re-add Product rich-result markup merely to silence a warning. If the site later publishes verifiable offer terms or qualifying reviews, update the structured data to match visible content and Google's current requirements.
- Keep FAQ answers visible to readers; do not add FAQPage markup solely to target rich results. Eligibility and search display are controlled by search engines.
- A Product rich-result enhancement warning is separate from crawling/indexing. Validate the deployed page and request revalidation in Search Console; investigate indexing separately with URL Inspection.
- Do not assert ingredient names, strain identities, certification, manufacturing location, directions, or return terms beyond what current authoritative documents support.
