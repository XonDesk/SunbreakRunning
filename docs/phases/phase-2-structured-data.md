# Phase 2: Structured Data - LocalBusiness Schema

**Priority**: High Impact, Medium Effort  
**Estimated Time**: 45-60 minutes  
**Prerequisites**: Completion of Phase 1, understanding of JSON format

> **✅ IMPLEMENTATION STATUS**  
> **Status**: COMPLETED  
> **Date**: 2025-12-21  
> **Branch**: `phase-2-structured-data` (merged to main)  
> **Commit**: e312bb6  
> **Implementation Notes**: Successfully added comprehensive LocalBusiness JSON-LD with all services, service area, and business details. Structured data added to `index.html` lines 42-183 (145 lines). See [COMPLETION_LOG.md](COMPLETION_LOG.md) for details.

## Objective

Implement Schema.org structured data (JSON-LD format) to help search engines understand that Sunbreak Running is a local business providing professional coaching services. This improves visibility in local search results, enables rich snippets, and enhances the overall SEO profile.

## Background Context

### About Sunbreak Running
- **Website**: sunbreakrunning.com
- **Business Type**: Virtual running coaching service
- **Primary Service Area**: Pacific Northwest (Redmond, Bothell, Bellevue, WA)
- **Coach**: Matt Jackson - USATF Level 1 Coach
- **Services**: Standard Plan, Basic Plan, 1:1 Training Sessions, Hour Consultations
- **Social Media**: Instagram (@mattjacksond)

### What is Structured Data?

Structured data is code added to your website that provides explicit information about your business to search engines in a standardized format. Think of it as a "nutrition label" for your website - it tells search engines exactly what your business offers.

**JSON-LD** (JavaScript Object Notation for Linked Data) is Google's recommended format for structured data because:
- Easy to implement (just add a script tag)
- Doesn't interfere with existing HTML
- Can be validated easily
- Widely supported

### Why LocalBusiness Schema?

Even though Sunbreak Running offers virtual coaching, implementing LocalBusiness schema provides:
1. **Local SEO Benefits**: Appears in searches like "running coach near me" or "Seattle running coach"
2. **Rich Results**: Potential for enhanced search listings with ratings, location, services
3. **Knowledge Panel**: May appear in Google's Knowledge Graph
4. **Trust Signals**: Shows Google you're a legitimate business
5. **Voice Search**: Better optimization for voice queries

## Implementation Steps

### 1. Understand the Schema Structure

We'll implement two schema types:
1. **LocalBusiness**: Basic business information
2. **ProfessionalService**: Specific to service-based businesses (coaching)

These can be combined in a single JSON-LD block.

### 2. Create the JSON-LD Structured Data

**File**: `/Users/mattjackson/Documents/Code/SunbreakRunning/index.html`

**Location**: In the `<head>` section, after the meta tags and before the stylesheet (around line 40)

**Complete Code**:

```html
<!-- Structured Data - LocalBusiness & Professional Service -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": ["LocalBusiness", "ProfessionalService", "SportsActivityLocation"],
  "name": "Sunbreak Running",
  "description": "Expert running coaching with Matt Jackson - personalized training programs, injury prevention, and performance optimization for runners of all levels. Virtual coaching serving the Pacific Northwest.",
  "url": "https://sunbreakrunning.com",
  "logo": "https://sunbreakrunning.com/images/img-1.jpg",
  "image": [
    "https://sunbreakrunning.com/images/img-1.jpg",
    "https://sunbreakrunning.com/images/img-2.jpg",
    "https://sunbreakrunning.com/images/img-3.jpg",
    "https://sunbreakrunning.com/images/img-4.jpg"
  ],
  
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Seattle",
    "addressRegion": "WA",
    "postalCode": "98052",
    "addressCountry": "US"
  },
  
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "47.6740",
    "longitude": "-122.1215"
  },
  
  "areaServed": [
    {
      "@type": "City",
      "name": "Redmond",
      "containedIn": {
        "@type": "State",
        "name": "Washington"
      }
    },
    {
      "@type": "City",
      "name": "Bellevue",
      "containedIn": {
        "@type": "State",
        "name": "Washington"
      }
    },
    {
      "@type": "City",
      "name": "Bothell",
      "containedIn": {
        "@type": "State",
        "name": "Washington"
      }
    },
    {
      "@type": "State",
      "name": "Washington"
    }
  ],
  
  "serviceArea": {
    "@type": "GeoCircle",
    "geoMidpoint": {
      "@type": "GeoCoordinates",
      "latitude": "47.6740",
      "longitude": "-122.1215"
    },
    "geoRadius": "100000"
  },
  
  "priceRange": "$$",
  
  "founder": {
    "@type": "Person",
    "name": "Matt Jackson",
    "jobTitle": "USATF Level 1 Running Coach",
    "description": "5+ years coaching state champions, D1 athletes and trail race winners. NCAA DII XC & Indoor/Outdoor Track athlete. Competitive runner of 13 years from 800m to 50 miles."
  },
  
  "sameAs": [
    "https://www.instagram.com/mattjacksond/"
  ],
  
  "knowsAbout": [
    "Running Coaching",
    "Marathon Training",
    "Trail Running",
    "Injury Prevention",
    "Strength Training for Runners",
    "Running Form Analysis",
    "Training Plans",
    "Sports Performance"
  ],
  
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Coaching Services",
    "itemListElement": [
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Standard Coaching Plan",
          "description": "Individualized running & strength plans with daily training modifications & feedback, weekly calls, unlimited email/text support, and TrainingPeaks platform access.",
          "serviceType": "Running Coaching"
        }
      },
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Basic Coaching Plan",
          "description": "Individualized running only plan with weekly training feedback, monthly calls, unlimited email/text support, and TrainingPeaks platform access.",
          "serviceType": "Running Coaching"
        }
      },
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "1:1 Training Sessions",
          "description": "In-person sessions for workouts, running form analysis, trail technique or strength training. Available for athletes in the Seattle area.",
          "serviceType": "Personal Training"
        }
      },
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Hour Consultation",
          "description": "Expert advice on training plans, race strategy, nutrition or anything running related. Perfect for getting personalized guidance on your running goals.",
          "serviceType": "Consultation"
        }
      }
    ]
  },
  
  "slogan": "Transform your running through intelligent, injury-free training that respects your body and accelerates your potential.",
  
  "keywords": "running coach, Seattle running coach, virtual running coaching, marathon training, trail running coach, injury prevention, USATF coach, Pacific Northwest running, Redmond running coach, Bellevue running coach, Bothell running coach"
}
</script>
```

## Field-by-Field Explanation

### Core Business Information
```json
"@type": ["LocalBusiness", "ProfessionalService", "SportsActivityLocation"]
```
- Multiple types tell Google this is a local business, professional service, AND sports-related
- Using multiple types is encouraged by Google for better categorization

### Location Data
```json
"address": {...}
"geo": {...}
```
- **Coordinates**: `47.6740, -122.1215` (Redmond city center)
- You can adjust to match your specific location or leave as city-center
- Even virtual businesses benefit from location data for local searches

### Service Area
```json
"areaServed": [...]
"serviceArea": {...}
```
- **areaServed**: Lists specific cities (Redmond, Bellevue, Bothell) + Washington state
- **serviceArea**: 100km radius circle (covers most of Puget Sound region)
- **Why both?**: Different search engines may prioritize different formats

### Price Range
```json
"priceRange": "$$"
```
- Uses $ - $$$$ scale (similar to Yelp)
- `$$` = Moderate pricing
- Adjust if you want to indicate different pricing tier

### Founder/Coach Information
```json
"founder": {...}
```
- Highlights Matt's credentials
- Helps with personal branding and trust signals
- Can add more fields like `sameAs` with personal social links if desired

### Services Catalog
```json
"hasOfferCatalog": {...}
```
- Lists all four coaching services from your website
- Helps Google understand what you offer
- Can appear in rich results

### Knowledge About
```json
"knowsAbout": [...]
```
- Keywords related to expertise
- Helps with semantic search and topic association

## Customization Options

### If You Want to Add Business Hours
Add this field after `priceRange`:
```json
"openingHoursSpecification": {
  "@type": "OpeningHoursSpecification",
  "dayOfWeek": [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ],
  "opens": "09:00",
  "closes": "18:00"
},
```

### If You Have Reviews/Ratings
Add this field after `priceRange`:
```json
"aggregateRating": {
  "@type": "AggregateRating",
  "ratingValue": "5",
  "reviewCount": "3",
  "bestRating": "5",
  "worstRating": "1"
},
```
**Note**: Only add this if you have actual reviews to back it up.

### If You Want to Add Contact Information
Add these fields after `url`:
```json
"telephone": "+1-XXX-XXX-XXXX",
"email": "contact@sunbreakrunning.com",
```

## Verification Steps

### 1. Validate JSON Syntax
Before adding to your website, validate the JSON:
- Visit: https://jsonlint.com/
- Paste your JSON-LD code
- Click "Validate JSON"
- Fix any syntax errors

### 2. Google Rich Results Test
**This is the most important validation step**

1. Visit: https://search.google.com/test/rich-results
2. Enter your URL: `https://sunbreakrunning.com` (after deploying)
   - Or paste the HTML code directly if testing before deployment
3. Click "Test URL" or "Test Code"
4. Wait for results

**What to look for**:
- ✅ "Page is eligible for rich results" (green check)
- Review detected items: LocalBusiness, ProfessionalService
- Warnings are usually okay, but fix errors

### 3. Schema Markup Validator
For more detailed validation:
1. Visit: https://validator.schema.org/
2. Paste your JSON-LD code
3. Review any warnings or errors

### 4. Preview in Search Console
After deployment (requires Google Search Console access):
1. Go to Search Console → URL Inspection
2. Enter: `https://sunbreakrunning.com`
3. Click "View tested page" → "More Info"
4. Check the "Structured Data" section

## Common Errors & Fixes

### Error: "Missing required field"
**Fix**: Ensure all required fields are present:
- `@type`
- `name`
- `address` (with `addressLocality` at minimum)

### Warning: "Property X not recognized"
**Fix**: Usually okay to ignore. Schema.org is flexible.

### Error: "Invalid coordinate format"
**Fix**: Ensure coordinates are numbers, not strings:
```json
"latitude": "47.6740",  // ❌ String
"latitude": 47.6740,     // ✅ Number
```

### Error: "Image URL not accessible"
**Fix**: Verify image URLs return 200 status:
```bash
curl -I https://sunbreakrunning.com/images/img-1.jpg
```

## Success Criteria

- [ ] JSON-LD structured data added to index.html
- [ ] Valid JSON syntax (passes jsonlint.com)
- [ ] Passes Google Rich Results Test with no errors
- [ ] Passes Schema.org validator
- [ ] All image URLs are accessible
- [ ] Coordinates are correct (if using specific location)
- [ ] Service descriptions accurately reflect your offerings
- [ ] Changes committed and pushed to GitHub Pages
- [ ] Verified in Google Search Console (24-48 hours after deployment)

## Deployment

```bash
cd /Users/mattjackson/Documents/Code/SunbreakRunning
git add index.html
git commit -m "Phase 2: Add LocalBusiness structured data schema"
git push origin main
```

## Expected Impact

**Immediate (1-2 weeks)**:
- Google can parse your business information
- Eligible for rich results in search
- Better understanding of your business type

**Medium-term (4-8 weeks)**:
- Improved local search rankings
- Potential appearance in local pack results
- Enhanced search result snippets

**Long-term (3-6 months)**:
- Possible Knowledge Panel
- Better voice search optimization
- Increased click-through rates from search

## Monitoring

Track performance in Google Search Console:
1. **Performance Report**: Monitor impressions and clicks for local keywords
2. **Enhancements → Unparsed structured data**: Check for errors
3. **URL Inspection**: Verify structured data is detected

## Next Steps

After completing Phase 2, proceed to:
- **Phase 3**: Content Optimization (alt text, headings, semantic HTML)
- Monitor structured data report in Search Console
- Consider adding reviews to enable aggregate ratings

## Troubleshooting

### Structured Data Not Showing in Search Console
- Wait 24-48 hours after deployment
- Request indexing via URL Inspection tool
- Verify the script tag is in the HTML source

### Rich Results Not Appearing in Search
- Rich results eligibility doesn't guarantee appearance
- Google decides when to show rich results
- Focus on other signals (quality content, backlinks)

### Need to Update Information
- Simply edit the JSON-LD in index.html
- Google will re-parse on next crawl (typically within days)
