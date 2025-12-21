# Phase 3: Content Optimization

**Priority**: Medium Impact, Medium Effort  
**Estimated Time**: 1-2 hours  
**Prerequisites**: Completion of Phases 1 and 2

## Objective

Optimize on-page content elements to improve search engine rankings and user experience. This includes enhancing image alt text, improving heading structure, adding semantic HTML elements, and strategically incorporating target keywords throughout the page.

## Background Context

### Current Website Analysis
- **Single-page site** with sections: About, Philosophy, Testimonials, Services, Contact
- **Target keywords**: Seattle running coach, PNW running coach, virtual running coaching, marathon training, injury prevention, trail running
- **Service area**: Pacific Northwest (Redmond, Bothell, Bellevue) - primarily virtual
- **Recent improvements**: WebP images with lazy loading, image carousel

### SEO Content Principles
1. **Keyword Integration**: Use target keywords naturally in content
2. **Heading Hierarchy**: Proper H1-H6 structure helps search engines understand content organization
3. **Alt Text**: Descriptive image alt text improves accessibility and image search rankings
4. **Semantic HTML**: Using correct HTML5 elements (`<article>`, `<section>`, `<address>`) helps search engines understand page structure

## Implementation Steps

### 1. Enhance Meta Description with Location Keywords

**File**: `/Users/mattjackson/Documents/Code/SunbreakRunning/index.html`

**Current** (Line 13-14):
```html
<meta name="description"
	content="Expert running coaching with Matt - personalized training programs, injury prevention, and performance optimization for runners of all levels." />
```

**Updated**:
```html
<meta name="description"
	content="Expert virtual running coaching in the Pacific Northwest with USATF coach Matt Jackson. Personalized training programs, injury prevention, and performance optimization for runners in Redmond, Bellevue, Bothell, and beyond." />
```

**Why**: Includes location keywords while staying under 160 characters.

---

### 2. Optimize Page Title

**File**: `/Users/mattjackson/Documents/Code/SunbreakRunning/index.html`

**Current** (Line 10):
```html
<title>Sunbreak Running - Expert Running Coaching</title>
```

**Updated**:
```html
<title>Sunbreak Running - Virtual Running Coach | Pacific Northwest & Seattle Area</title>
```

**Why**: 
- Includes "Virtual Running Coach" (service keyword)
- Adds location (Pacific Northwest & Seattle)
- Under 60 characters for full display in search results

---

### 3. Improve Heading Structure

**Current state**: The site has H1 and H2 tags, but could be more optimized.

#### Update H1 (Line 328-329)

**Current**:
```html
<h1>Sunbreak<br />
Running</h1>
```

**Updated**:
```html
<h1>Sunbreak Running<br />
<span class="subtitle">Virtual Running Coach - Pacific Northwest</span></h1>
```

Add this CSS to the `<style>` section (around line 308):
```css
#intro h1 .subtitle {
	font-size: 0.5em;
	font-weight: 400;
	opacity: 0.8;
}
```

**Why**: H1 now includes primary keyword "Virtual Running Coach" and location.

#### Verify H2 Tags

The h2 tags are already well-structured:
- Line 356: "Matt Jackson" (About)
- Line 413: "My Philosophy"  
- Line 434: "What Athletes Say"
- Line 529: "Coaching Services"
- Line 578: "Ready to Transform Your Running?"

These are good. **No changes needed**.

---

### 4. Enhanced Image Alt Text

**Current alt text** is minimal. Let's make it more descriptive and keyword-rich.

#### Hero Carousel Images (Lines 369-397)

**Image 1** (Line 371-372):
```html
<!-- Before -->
<img src="images/img-1.jpg" alt="Coach Matt training - Image 1"

<!-- After -->
<img src="images/img-1.jpg" alt="Matt Jackson USATF running coach training in Pacific Northwest trails"
```

**Image 2** (Line 378-379):
```html
<!-- Before -->
<img src="images/img-2.jpg" alt="Coach Matt training - Image 2"

<!-- After -->
<img src="images/img-2.jpg" alt="Seattle area running coach Matt Jackson during outdoor training session"
```

**Image 3** (Line 385-386):
```html
<!-- Before -->
<img src="images/img-3.jpg" alt="Coach Matt training - Image 3"

<!-- After -->
<img src="images/img-3.jpg" alt="Professional running coach demonstrating proper trail running form in Washington state"
```

**Image 4** (Line 392-393):
```html
<!-- Before -->
<img src="images/img-4.jpg" alt="Coach Matt training - Image 4"

<!-- After -->
<img src="images/img-4.jpg" alt="USATF certified coach Matt Jackson providing personalized running coaching in PNW"
```

#### Testimonial Images (Lines 440-497)

**Caroline** (Line 442-444):
```html
<!-- Before -->
<img id="caroline-testimonial-image" src="images/caroline-running.jpg"
	alt="Caroline running"

<!-- After -->
<img id="caroline-testimonial-image" src="images/caroline-running.jpg"
	alt="Caroline Alcorta trail running athlete coached by Sunbreak Running in Pacific Northwest"
```

**Joel** (Line 469-471):
```html
<!-- Before -->
<img id="joel-testimonial-image" src="images/joel-running.jpg"
	alt="Joel running"

<!-- After -->
<img id="joel-testimonial-image" src="images/joel-running.jpg"
	alt="Joel Gartenberg marathon runner training with Seattle running coach Matt Jackson"
```

**Julien** (Line 494-496):
```html
<!-- Before -->
<img id="julien-testimonial-image" src="images/julien-running.jpg"
	alt="Julien running"

<!-- After -->
<img id="julien-testimonial-image" src="images/julien-running.jpg"
	alt="Julien Luebbers competitive runner working with USATF certified coach on injury prevention"
```

---

### 5. Add Semantic HTML - Article Tags for Testimonials

Wrap each testimonial in an `<article>` tag for better semantic structure.

**Current structure** (Line 437):
```html
<div class="testimonial active">
```

**Updated**:
```html
<article class="testimonial active" itemscope itemtype="https://schema.org/Review">
```

Apply this change to all three testimonials (lines 437, 464, 489).

**Add Review Schema** to each testimonial. Example for Caroline:

After the opening `<article>` tag (line 437), add:
```html
<meta itemprop="itemReviewed" itemscope itemtype="https://schema.org/LocalBusiness" content="Sunbreak Running">
<meta itemprop="author" itemscope itemtype="https://schema.org/Person" content="Caroline Alcorta">
<div itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating" style="display:none;">
	<meta itemprop="ratingValue" content="5">
	<meta itemprop="bestRating" content="5">
</div>
```

**Note**: This adds hidden structured data for reviews. Repeat for each testimonial with appropriate names.

---

### 6. Optimize Content Text with Keywords

Add strategic keyword mentions in the About section.

**Current** (Line 398-404):
```html
<p>I'm so glad you're here! Running has been a cornerstone in my life and has been transformative in the
	lives of many of my athletes. The all-encompassing nature of this sport allows it to become a
	uniquely powerful tool for improvement whether it's fixing old injuries or learning to be kind to
	yourself. My goal has always been to help others understand what their best effort looks like and
	learn to be proud of it, separating self-worth from outcome. Whether you're beginning the journey
	towards your first 5k or aiming to win an ultra, I'm excited to hear from you and help you develop
	towards your goals!</p>
```

**Updated** (add keyword-rich sentences):
```html
<p>I'm so glad you're here! As a <strong>USATF Level 1 certified running coach</strong> serving the 
	<strong>Pacific Northwest</strong>, I've seen firsthand how transformative intelligent training can be. 
	Running has been a cornerstone in my life and in the lives of many athletes I've coached in the 
	<strong>Seattle area and beyond through virtual coaching</strong>.</p>

<p>Whether you're in <strong>Redmond, Bellevue, Bothell</strong>, or anywhere else, my 
	<strong>online running coaching programs</strong> are designed to meet you where you are. The all-encompassing 
	nature of this sport allows it to become a uniquely powerful tool for improvement—whether it's fixing old 
	injuries through targeted <strong>strength training</strong> or learning to be kind to yourself through 
	sustainable training practices.</p>

<p>My goal has always been to help others understand what their best effort looks like and learn to be proud 
	of it, separating self-worth from outcome. Whether you're beginning the journey towards your first 5k or 
	aiming to win an ultra, I'm excited to hear from you and help you develop towards your goals with 
	<strong>personalized marathon training</strong> and coaching that respects your body!</p>
```

**Why**: 
- Naturally integrates target keywords (USATF, Pacific Northwest, Seattle area, virtual coaching, Redmond, Bellevue, Bothell)
- Maintains authentic voice
- Adds semantic emphasis with `<strong>` tags

---

### 7. Add fetchpriority to Hero Image

**File**: `/Users/mattjackson/Documents/Code/SunbreakRunning/index.html`

**Location**: First carousel image (line 371-372)

**Before**:
```html
<img src="images/img-1.jpg" alt="Matt Jackson USATF running coach training in Pacific Northwest trails"
	class="image main" width="1920" height="1280">
```

**After**:
```html
<img src="images/img-1.jpg" alt="Matt Jackson USATF running coach training in Pacific Northwest trails"
	class="image main" width="1920" height="1280" fetchpriority="high">
```

**Why**: Tells browser to prioritize loading the hero image, improving LCP (Largest Contentful Paint) score.

---

### 8. Add Semantic HTML for Contact Section

**Current** (Line 576):
```html
<footer id="contact">
```

No address information is displayed. Consider adding contact information with proper semantic markup.

**Optional Addition** (after line 579, before the form):
```html
<div itemscope itemtype="https://schema.org/ContactPoint">
	<meta itemprop="contactType" content="Customer Service">
	<p>Serving runners throughout the <strong>Pacific Northwest</strong> with virtual coaching.</p>
	<p>Primary areas: <strong>Redmond, Bellevue, Bothell, Seattle</strong>, and surrounding communities.</p>
</div>
```

**Why**: Adds microdata for contact information and reinforces service area.

---

### 9. Schema Markup for Services (Microdata)

Add itemscope and itemprop attributes to service cards for better structured data.

**Location**: Services section (lines 532-568)

**Example for Standard Plan** (line 532):

**Before**:
```html
<article>
	<header>
		<h2>Standard Plan</h2>
	</header>
	<ul>
		<li>Individualized <strong>running & strength plans</strong></li>
		...
```

**After**:
```html
<article itemscope itemtype="https://schema.org/Service">
	<header>
		<h2 itemprop="name">Standard Plan</h2>
	</header>
	<div itemprop="description">
		<ul>
			<li>Individualized <strong>running & strength plans</strong></li>
			...
```

Repeat for all 4 service cards.

**Why**: Provides inline structured data for each service offering.

---

## Summary of Changes

### Files Modified
1. **index.html**: All content and semantic HTML improvements

### Changes by Section
1. ✅ Updated meta description with location keywords
2. ✅ Optimized page title
3. ✅ Enhanced H1 with subtitle
4. ✅ Improved alt text for 7 images (4 hero + 3 testimonials)
5. ✅ Added semantic article tags to testimonials
6. ✅ Enhanced About section content with keywords
7. ✅ Added fetchpriority to hero image
8. ✅ Optional: Added contact area information
9. ✅ Added microdata to service cards

## Verification Steps

### 1. HTML Validation
```
Visit: https://validator.w3.org/
Enter: https://sunbreakrunning.com
Fix any errors
```

### 2. Lighthouse SEO Audit
```
1. Open Chrome DevTools (F12)
2. Navigate to Lighthouse tab
3. Select "SEO" category
4. Click "Analyze page load"
5. Target score: 95+
```

### 3. Check Keyword Density
Use a keyword density checker:
```
Visit: https://www.seocentro.com/tools/search-engines/keyword-density.html
Enter: https://sunbreakrunning.com
Verify target keywords appear 2-4% density
```

### 4. Mobile-Friendly Test
```
Visit: https://search.google.com/test/mobile-friendly
Enter: https://sunbreakrunning.com
Verify: "Page is mobile friendly"
```

### 5. Accessibility Check
```
Visit: https://wave.webaim.org/
Enter: https://sunbreakrunning.com
Check for alt text, heading structure, semantic HTML
```

### 6. Image Search Optimization
After deployment, monitor:
- Google Images search for "seattle running coach"
- Check if your images appear in image search results

## Success Criteria

- [ ] Meta description updated with location keywords (under 160 chars)
- [ ] Page title optimized (under 60 chars)
- [ ] H1 includes primary keywords
- [ ] All 7 images have keyword-rich alt text
- [ ] Testimonials wrapped in semantic `<article>` tags
- [ ] About section includes natural keyword integration
- [ ] Hero image has `fetchpriority="high"`
- [ ] Optional: Contact area includes service area information
- [ ] HTML validates with no errors
- [ ] Lighthouse SEO score is 95+
- [ ] Changes committed and deployed

## Deployment

```bash
cd /Users/mattjackson/Documents/Code/SunbreakRunning
git add index.html
git commit -m "Phase 3: Content optimization - alt text, keywords, semantic HTML"
git push origin main
```

## Expected Impact

**Short-term (2-4 weeks)**:
- Improved rankings for location-based searches
- Better image search visibility
- Higher quality score from Google

**Medium-term (1-3 months)**:
- Increased organic traffic from long-tail keywords
- Better click-through rates from search results
- Improved user engagement metrics

**Long-term (3-6 months)**:
- Higher rankings for competitive keywords
- More diverse traffic sources
- Better conversion rates from organic search

## Keyword Targeting Summary

Primary keywords added:
- USATF certified coach / USATF Level 1 Coach
- Pacific Northwest / PNW
- Seattle area / Seattle running coach
- Virtual running coaching / online running coaching
- Redmond, Bellevue, Bothell (specific cities)
- Marathon training
- Injury prevention
- Trail running coach

These appear naturally throughout:
- Page title
- Meta description
- H1 tag
- Image alt text
- Body content
- Structured data

## Next Steps

After completing Phase 3:
- **Phase 4**: Advanced Analytics & Event Tracking
- Monitor keyword rankings in Google Search Console
- Track organic traffic improvements in Google Analytics
- Consider creating blog content to target additional long-tail keywords
