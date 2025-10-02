# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

SunbreakRunning is a static website hosted via GitHub Pages at sunbreakrunning.com. The site uses the "Massively" template from HTML5 UP, which is a text-heavy, article-oriented design perfect for a running coach's blog and portfolio.

## Repository Structure

This is a GitHub Pages repository with:
- **Massively Template**: Complete HTML5 UP template with responsive design
- **Personal Assets**: `Sunbreak Assets/` folder containing running photos and client testimonials
- **Template Assets**: `assets/` (CSS/JS/SASS), `images/` (template images)
- **Pages**: `index.html` (main), `generic.html`, `elements.html`
- **Domain Configuration**: CNAME file for sunbreakrunning.com
- **Licensing**: GNU GPL v3 for custom content, CCA 3.0 for template

## Common Commands

### Development Workflow
```powershell
# Start local development server (if using live server extension)
# Open index.html in browser for local testing

# Check what files have changed
git status

# Stage and commit changes
git add .
git commit -m "Descriptive commit message"

# Deploy to GitHub Pages
git push origin main
```

### Template Customization
```powershell
# Compile SASS to CSS (if making style changes)
cd assets/sass
# Use a SASS compiler or VS Code extension

# Optimize images before replacing template images
# Copy from "Sunbreak Assets" to "images" folder

# Preview changes locally before committing
# Test responsive design on different screen sizes
```

### GitHub Pages Deployment
- Changes to `main` branch automatically deploy to sunbreakrunning.com
- CNAME file configures custom domain
- No build process required for static files
- Template includes all necessary minified assets

## Development Guidelines

### Template Structure
- **Main Layout**: Header with navigation, intro section, main content area, footer
- **Responsive Design**: Mobile-first approach with breakpoints
- **Blog-oriented**: Featured post + grid of article previews
- **Components**: Forms, pagination, social media icons, image galleries

### Asset Management
- **Replace template images** in `images/` with photos from `Sunbreak Assets/`
- **Template images to replace**:
  - `bg.jpg` - Main background image
  - `pic01.jpg` - `pic09.jpg` - Article/post images
- **Maintain aspect ratios** and optimize file sizes
- **Use relative paths** for all assets

### Content Customization Priority
1. **Header/Navigation**: Change "Massively" to "Sunbreak Running"
2. **Hero Section**: Replace intro text with coaching message
3. **Featured Post**: Create main coaching services article
4. **Article Grid**: Replace with running tips, client success stories
5. **Footer Contact**: Update with real contact information
6. **Social Links**: Add actual social media profiles

### Personal Assets Available
- **Client Testimonials**: Joel and Julien testimonials (text files)
- **Running Photos**: Various race and action shots
- **Generated Images**: AI-generated running-themed graphics

## Customization Roadmap

### Phase 1: Basic Branding
- Update site title and navigation from "Massively" to "Sunbreak Running"
- Replace hero section with coaching introduction
- Update footer contact information
- Add real social media links

### Phase 2: Content Integration
- Replace featured post with main coaching services overview
- Create blog posts using client testimonials
- Replace template images with personal running photos
- Update navigation menu items

### Phase 3: Advanced Features
- Add coaching services page (use `generic.html` as template)
- Create testimonials section with client photos
- Add training program information
- Integrate contact form functionality
- Add calendar/scheduling integration

### Template Features to Leverage
- **Parallax scrolling** background
- **Responsive image galleries**
- **Built-in pagination** for blog posts
- **Contact forms** (will need backend integration)
- **Social media integration**
- **FontAwesome icons** for services/features

## Licensing

This project is licensed under GNU General Public License v3 - see LICENSE file for details.