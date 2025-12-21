# Phase 4: Advanced Analytics & Event Tracking

**Priority**: Medium Impact, Medium Effort  
**Estimated Time**: 1 hour  
**Prerequisites**: Completion of Phases 1-3, Google Analytics 4 already configured

## Objective

Enhance Google Analytics tracking to capture detailed user interactions and behavior on the website. This provides insights into what content engages visitors, which calls-to-action are effective, and where users are in their journey, enabling data-driven optimization decisions.

## Background Context

### Current Analytics Setup
- **Google Analytics 4** (GA4) property: `G-QYC49P6HMB`
- **Additional tracking**: Rybbit.io analytics (`fda22996a6f1`)
- **Current tracking**: Basic pageviews and sessions
- **Missing**: Event tracking for user interactions

### Why Event Tracking Matters
Without custom event tracking, you can't answer questions like:
- How many visitors click "Schedule a consultation"?
- Do people interact with the image carousel?
- Which testimonial gets viewed most?
- Are visitors scrolling through the entire page?
- How many people click through to Instagram?

Event tracking provides this visibility.

## Implementation Steps

### 1. Enhanced gtag Configuration

**File**: `/Users/mattjackson/Documents/Code/SunbreakRunning/index.html`

**Location**: Modify the existing GA4 script (lines 311-319)

**Current**:
```html
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-QYC49P6HMB"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() { dataLayer.push(arguments); }
	gtag('js', new Date());

	gtag('config', 'G-QYC49P6HMB');
</script>
```

**Updated**:
```html
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-QYC49P6HMB"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() { dataLayer.push(arguments); }
	gtag('js', new Date());

	gtag('config', 'G-QYC49P6HMB', {
		'send_page_view': true,
		'anonymize_ip': true,  // Privacy-friendly
		'cookie_flags': 'SameSite=None;Secure'
	});
</script>
```

---

### 2. Create Event Tracking Script

Add a new `<script>` section at the bottom of the page, just before the closing `</body>` tag (after line 617).

**Complete event tracking script**:

```javascript
<script>
// Event Tracking for Sunbreak Running

// Track CTA button clicks
document.addEventListener('DOMContentLoaded', function() {
	
	// Track "Schedule a consultation" button clicks
	const ctaButtons = document.querySelectorAll('a[href="#contact"], .button.large');
	ctaButtons.forEach(function(button) {
		button.addEventListener('click', function(e) {
			const buttonText = this.textContent.trim();
			gtag('event', 'cta_click', {
				'event_category': 'engagement',
				'event_label': buttonText,
				'value': 1
			});
		});
	});
	
	// Track form submission
	const contactForm = document.getElementById('contact-form');
	if (contactForm) {
		contactForm.addEventListener('submit', function(e) {
			gtag('event', 'form_submit', {
				'event_category': 'conversion',
				'event_label': 'contact_form',
				'value': 10
			});
		});
	}
	
	// Track Instagram link clicks
	const instagramLinks = document.querySelectorAll('a[href*="instagram.com"]');
	instagramLinks.forEach(function(link) {
		link.addEventListener('click', function(e) {
			gtag('event', 'outbound_link', {
				'event_category': 'social',
				'event_label': 'instagram',
				'value': 1
			});
		});
	});
	
	// Track image carousel interactions
	let carouselIndex = 0;
	const originalChangeCarousel = window.changeCarousel;
	window.changeCarousel = function(direction) {
		carouselIndex += direction;
		gtag('event', 'carousel_interaction', {
			'event_category': 'engagement',
			'event_label': direction > 0 ? 'next' : 'previous',
			'value': carouselIndex
		});
		if (originalChangeCarousel) {
			originalChangeCarousel(direction);
		}
	};
	
	// Track testimonial carousel interactions
	let testimonialIndex = 0;
	const originalChangeTestimonial = window.changeTestimonial;
	window.changeTestimonial = function(direction) {
		testimonialIndex += direction;
		gtag('event', 'testimonial_view', {
			'event_category': 'engagement',
			'event_label': direction > 0 ? 'next' : 'previous',
			'value': testimonialIndex
		});
		if (originalChangeTestimonial) {
			originalChangeTestimonial(direction);
		}
	};
	
	// Track scroll depth
	let scrollDepths = [25, 50, 75, 100];
	let scrollTracked = [];
	
	window.addEventListener('scroll', function() {
		const scrollPercent = (window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)) * 100;
		
		scrollDepths.forEach(function(depth) {
			if (scrollPercent >= depth && !scrollTracked.includes(depth)) {
				scrollTracked.push(depth);
				gtag('event', 'scroll_depth', {
					'event_category': 'engagement',
					'event_label': depth + '%',
					'value': depth
				});
			}
		});
	});
	
	// Track navigation link clicks
	const navLinks = document.querySelectorAll('#nav a[href^="#"]');
	navLinks.forEach(function(link) {
		link.addEventListener('click', function(e) {
			const section = this.getAttribute('href').replace('#', '');
			gtag('event', 'navigation_click', {
				'event_category': 'navigation',
				'event_label': section,
				'value': 1
			});
		});
	});
	
	// Track time on page (send event every 30 seconds)
	let timeOnPage = 0;
	setInterval(function() {
		timeOnPage += 30;
		gtag('event', 'time_on_page', {
			'event_category': 'engagement',
			'event_label': timeOnPage + '_seconds',
			'value': timeOnPage,
			'non_interaction': true
		});
	}, 30000);
	
	// Track service card views (intersection observer)
	if ('IntersectionObserver' in window) {
		const serviceObserver = new IntersectionObserver(function(entries) {
			entries.forEach(function(entry) {
				if (entry.isIntersecting) {
					const serviceName = entry.target.querySelector('h2').textContent.trim();
					gtag('event', 'service_view', {
						'event_category': 'engagement',
						'event_label': serviceName,
						'value': 1
					});
					serviceObserver.unobserve(entry.target);
				}
			});
		}, { threshold: 0.5 });
		
		document.querySelectorAll('#services article').forEach(function(article) {
			serviceObserver.observe(article);
		});
	}
});
</script>
```

---

### 3. Event Tracking Summary

Here's what each event tracks:

| Event Name | Tracks | Value |
|------------|--------|-------|
| `cta_click` | All CTA button clicks | 1 per click |
| `form_submit` | Contact form submissions | 10 (high value) |
| `outbound_link` | Instagram link clicks | 1 per click |
| `carousel_interaction` | Hero image carousel navigation | Current index |
| `testimonial_view` | Testimonial carousel views | Current index |
| `scroll_depth` | How far users scroll (25%, 50%, 75%, 100%) | Depth percentage |
| `navigation_click` | Top nav menu clicks | 1 per click |
| `time_on_page` | User engagement duration | Seconds (every 30s) |
| `service_view` | When service cards come into view | 1 per view |

---

### 4. Enhanced Form Tracking with Field Completion

**Optional**: Track which form fields users interact with (useful for optimization).

Add after the form submit tracking:
```javascript
// Track form field interactions
const formFields = contactForm.querySelectorAll('input, textarea');
formFields.forEach(function(field) {
	field.addEventListener('blur', function() {
		if (this.value.length > 0) {
			gtag('event', 'form_field_complete', {
				'event_category': 'form',
				'event_label': this.name,
				'value': 1
			});
		}
	});
});
```

---

### 5. Add Performance Monitoring

Track Core Web Vitals automatically:

```javascript
<script>
// Core Web Vitals tracking
function sendWebVitalsToGA(metric) {
	gtag('event', metric.name, {
		'event_category': 'Web Vitals',
		'event_label': metric.id,
		'value': Math.round(metric.name === 'CLS' ? metric.value * 1000 : metric.value),
		'non_interaction': true
	});
}

// If web-vitals library is available (optional enhancement)
if (typeof webVitals !== 'undefined') {
	webVitals.getCLS(sendWebVitalsToGA);
	webVitals.getFID(sendWebVitalsToGA);
	webVitals.getLCP(sendWebVitalsToGA);
}
</script>
```

**Note**: This requires adding the web-vitals library. For simplest implementation, you can skip this or add:
```html
<script src="https://unpkg.com/web-vitals@3/dist/web-vitals.iife.js"></script>
```

---

## Verification Steps

### 1. Test Events Locally

With the local dev server running:
```bash
# If not already running
cd /Users/mattjackson/Documents/Code/SunbreakRunning
python3 -m http.server 8000
```

Open in Chrome:
1. Navigate to `http://localhost:8000`
2. Open DevTools (F12) → Console tab
3. Perform actions (click buttons, scroll, navigate)
4. Check console for GA event messages (you may see network requests to google-analytics.com)

### 2. Use GA4 DebugView

**Enable debug mode** by adding this to the gtag config:
```javascript
gtag('config', 'G-QYC49P6HMB', {
	'debug_mode': true
});
```

Then in Google Analytics:
1. Go to Admin → DebugView
2. Open your website
3. Perform tracked actions
4. Watch events appear in real-time

**Remove `debug_mode` before final deployment.**

### 3. Check GA4 Events Report

After deployment (wait 24-48 hours for data):
1. Go to Google Analytics
2. Reports → Engagement → Events
3. Verify your custom events appear:
   - `cta_click`
   - `form_submit`
   - `scroll_depth`
   - etc.

### 4. Test Individual Events

Create a testing checklist:

- [ ] Click "Schedule a consultation" button → `cta_click` fires
- [ ] Submit contact form → `form_submit` fires
- [ ] Click Instagram link → `outbound_link` fires
- [ ] Click carousel arrows → `carousel_interaction` fires
- [ ] Click testimonial arrows → `testimonial_view` fires
- [ ] Scroll to 25% → `scroll_depth` fires
- [ ] Click nav menu items → `navigation_click` fires
- [ ] Scroll past service cards → `service_view` fires

---

## Success Criteria

- [ ] Event tracking script added to index.html
- [ ] All 9 event types configured
- [ ] Events fire correctly in DebugView
- [ ] No JavaScript errors in console
- [ ] Events appear in GA4 Events report (after 24-48 hours)
- [ ] Performance impact is minimal (Lighthouse score unchanged)
- [ ] Changes committed and deployed

---

## Viewing Data in Google Analytics

### Create Custom Event Reports

1. **Go to Explorations** (in GA4)
2. Create a new **Free Form** report
3. Add dimensions:
   - Event name
   - Event label
   - Event category
4. Add metrics:
   - Event count
   - Total users
5. Filter by your custom events

### Set Up Conversions

Mark important events as conversions:
1. Go to Admin → Events
2. Find `form_submit`
3. Toggle "Mark as conversion"

Now you can track conversion rate!

### Create Funnels

Track user journey:
1. Explorations → Funnel exploration
2. Steps:
   - Step 1: Page view
   - Step 2: `scroll_depth` (50%)
   - Step 3: `service_view`
   - Step 4: `cta_click`
   - Step 5: `form_submit`

This shows where users drop off.

---

## Privacy Considerations

The implementation includes privacy-friendly settings:
- `anonymize_ip: true` - IP addresses are anonymized
- No PII (Personally Identifiable Information) is tracked
- Events track behavior, not personal data
- Complies with GDPR/CCPA guidelines

If you want to add a cookie consent banner, consider using a library like:
- CookieYes
- OneTrust
- Custom implementation

---

## Deployment

```bash
cd /Users/mattjackson/Documents/Code/SunbreakRunning
git add index.html
git commit -m "Phase 4: Add advanced GA4 event tracking and analytics"
git push origin main
```

---

## Expected Impact

**Immediate (1-2 weeks)**:
- Visibility into user behavior
- Understand which CTAs are effective
- See where users engage most

**Medium-term (2-8 weeks)**:
- Data-driven insights for optimization
- Identify high-performing content
- Understand conversion paths

**Long-term (3+ months)**:
- Optimize conversion rate based on data
- A/B test changes using real metrics
- Calculate ROI of SEO efforts

---

## Key Metrics to Monitor

### Engagement Metrics
- **Scroll depth**: What % of users read entire page?
- **Time on page**: Average engagement time
- **Service views**: Which services get most attention?

### Conversion Metrics
- **CTA click rate**: % of visitors who click consultation button
- **Form submission rate**: % who complete the form
- **Navigation usage**: Which sections do users navigate to?

### Traffic Quality
- **Bounce rate**: Compare organic vs direct vs social traffic
- **Pages per session**: Are users exploring content?
- **Return visitors**: Are people coming back?

---

## Troubleshooting

### Events Not Firing
1. Check browser console for JavaScript errors
2. Verify gtag is loaded: Type `gtag` in console, should return function
3. Enable debug mode and check DebugView
4. Verify element selectors match your HTML

### Events Fire Multiple Times
- Check for duplicate event listeners
- Ensure DOMContentLoaded wrapper is used
- Use `{ once: true }` option in addEventListener if needed

### Events Don't Appear in GA4
- Wait 24-48 hours for processing
- Check DebugView for real-time events
- Verify GA4 property ID is correct
- Ensure ad blockers are disabled during testing

---

## Next Steps

After completing Phase 4:
- **Phase 5**: Long-term Strategy (blog content, backlinks, etc.)
- Monitor data weekly for insights
- Create custom dashboards in GA4
- Set up automated reports (weekly/monthly email summaries)
- Use insights to refine content and CTAs

---

## Optional Enhancements

### Email Notifications for Form Submissions
Set up GA4 → BigQuery → Cloud Functions to send email alerts when form submissions hit a threshold.

### Heatmap Integration
Consider tools like:
- Hotjar
- Microsoft Clarity (free)
- Lucky Orange

These provide visual heatmaps of clicks and scrolling.

### A/B Testing
Use Google Optimize or custom implementation to test:
- Different CTA button text
- Hero image variations
- Testimonial order
