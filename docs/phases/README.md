# SEO Optimization - Phase Documentation

This directory contains detailed documentation for each phase of the SEO optimization plan for Sunbreak Running.

## Overview

The SEO optimization is divided into 5 phases, each designed to be executed independently by an agent or developer. Each phase document is self-contained with all necessary context, implementation steps, verification procedures, and success criteria.

## Phases

### [Phase 1: Quick Wins - Technical SEO Foundations](phase-1-quick-wins.md)
**Priority**: High Impact, Low Effort  
**Time**: 30-45 minutes

Implement fundamental SEO improvements:
- Create robots.txt
- Create sitemap.xml
- Add canonical URL tags
- Add Open Graph meta tags
- Add Twitter Card tags
- Add theme color and preconnect hints

**Start here** for immediate SEO benefits.

---

### [Phase 2: Structured Data - LocalBusiness Schema](phase-2-structured-data.md)
**Priority**: High Impact, Medium Effort  
**Time**: 45-60 minutes

Implement Schema.org structured data for local SEO:
- Add LocalBusiness JSON-LD schema
- Add ProfessionalService schema
- Configure service area (Pacific Northwest focus)
- Include business details and offerings

**Note**: Customized for virtual coaching serving Redmond, Bellevue, Bothell, and broader PNW region.

---

### [Phase 3: Content Optimization](phase-3-content-optimization.md)
**Priority**: Medium Impact, Medium Effort  
**Time**: 1-2 hours

Optimize on-page content and semantic HTML:
- Enhance meta description and page title
- Improve heading structure (H1 optimization)
- Add keyword-rich alt text to images
- Integrate target keywords naturally in content
- Add semantic HTML elements
- Implement review schema for testimonials

---

### [Phase 4: Advanced Analytics & Event Tracking](phase-4-advanced-analytics.md)
**Priority**: Medium Impact, Medium Effort  
**Time**: 1 hour

Enhance Google Analytics 4 tracking:
- Track CTA button clicks
- Monitor form submissions
- Track carousel interactions
- Measure scroll depth
- Monitor navigation clicks
- Track service card views
- Measure time on page

---

### [Phase 5: Long-term SEO Strategy](phase-5-long-term-strategy.md)
**Priority**: High Impact, High Effort  
**Time**: Ongoing (3-6 months)

Establish sustainable SEO practices:
- Content strategy (blog, video)
- Backlink building
- Review & reputation management
- Technical SEO maintenance
- Competitive analysis
- Email marketing integration
- Social media strategy

---

## Recommended Execution Order

1. **Phase 1** → Quick foundational improvements
2. **Phase 2** → Structured data for local SEO
3. **Phase 3** → Content optimization
4. **Phase 4** → Analytics tracking
5. **Phase 5** → Ongoing long-term strategy

Phases 1-4 can be completed in sequence over 1-2 weeks. Phase 5 is an ongoing, iterative process.

## Prerequisites

### For All Phases
- Access to GitHub repository: `/Users/mattjackson/Documents/Code/SunbreakRunning`
- Ability to edit HTML files
- Git knowledge for committing and pushing changes
- Access to local development server (Python HTTP server)

### For Phase 4
- Google Analytics 4 access (Property ID: `G-QYC49P6HMB`)
- Understanding of JavaScript

### For Phase 5
- Google Search Console access
- Google Business Profile access (or ability to create one)
- Content creation skills (writing, video optional)

## Context: Sunbreak Running

### Business Details
- **Website**: sunbreakrunning.com (GitHub Pages)
- **Business**: Virtual running coaching
- **Coach**: Matt Jackson (USATF Level 1 Coach)
- **Service Area**: Pacific Northwest, specifically Redmond, Bellevue, Bothell areas
- **Services**: Standard Plan, Basic Plan, 1:1 Training, Hour Consultation
- **Social**: Instagram (@mattjacksond)

### Target Keywords
- Seattle running coach
- Pacific Northwest running coach
- Virtual running coaching
- Marathon training Seattle
- Injury prevention running
- USATF coach
- Trail running coach PNW

### Current State
- Single-page HTML website
- Google Analytics 4 configured
- Images optimized (WebP format with lazy loading)
- Basic SEO in place (title, meta description)

## Verification Resources

After implementing each phase, use these tools to verify success:

- **HTML Validation**: https://validator.w3.org/
- **Rich Results Test**: https://search.google.com/test/rich-results
- **Schema Validator**: https://validator.schema.org/
- **Open Graph Preview**: https://www.opengraph.xyz/
- **Twitter Card Validator**: https://cards-dev.twitter.com/validator
- **Sitemap Validator**: https://www.xml-sitemaps.com/validate-xml-sitemap.html
- **Mobile-Friendly Test**: https://search.google.com/test/mobile-friendly
- **PageSpeed Insights**: https://pagespeed.web.dev/
- **Lighthouse**: Built into Chrome DevTools

## Success Metrics

### Short-term (1-2 months)
- All technical SEO foundations in place
- Structured data validated and indexed
- Lighthouse SEO score 95+
- Google Search Console configured

### Medium-term (3-6 months)
- 2+ target keywords in top 10 Google rankings
- 50-100% increase in organic traffic
- 10+ quality backlinks
- 10+ Google reviews

### Long-term (6-12 months)
- 100-200% increase in organic traffic
- Top 5 rankings for primary keywords
- 20+ quality backlinks
- Established content marketing rhythm
- Consistent leads from organic search

## Questions or Issues?

Each phase document includes:
- Detailed implementation steps
- Complete code examples
- Verification procedures
- Troubleshooting guidance
- Success criteria

If you encounter issues:
1. Check the troubleshooting section in the relevant phase doc
2. Verify prerequisites are met
3. Use the verification tools to identify specific problems
4. Review Google Search Console for errors

## Local Development Server

All phases assume you have a local server running for testing:

```bash
cd /Users/mattjackson/Documents/Code/SunbreakRunning
python3 -m http.server 8000
```

Then test at `http://localhost:8000` before deploying to GitHub Pages.

## Implementation Notes

- **Make backups**: Commit changes frequently
- **Test locally first**: Always verify changes work before pushing
- **One phase at a time**: Complete and verify each phase before moving to the next
- **Document changes**: Use clear git commit messages
- **Monitor results**: Check Google Search Console and Analytics regularly

---

**Last Updated**: 2025-12-21  
**Maintained By**: SEO Optimization Project for Sunbreak Running
