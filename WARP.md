# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview
Sunbreak Running is a static marketing website for a Pacific Northwest running coach, built with Astro and deployed to GitHub Pages at sunbreakrunning.com.

## Development Commands

### Local Development
```bash
npm run dev        # Start dev server (typically at http://localhost:4321)
npm run build      # Build for production (outputs to dist/)
npm run preview    # Preview production build locally
```

### Dependencies
```bash
npm ci             # Install exact dependencies from lockfile (preferred for consistency)
npm install        # Install dependencies
```

## Deployment
- **Auto-deploy**: Pushes to `main` branch trigger automatic deployment via GitHub Actions (`.github/workflows/deploy.yml`)
- **Manual deploy**: Use workflow_dispatch in GitHub Actions UI
- **Build output**: Static files generated in `dist/` directory
- **Target**: GitHub Pages at https://sunbreakrunning.com
- **Custom domain**: Configured via `CNAME` file in root

## Architecture

### Tech Stack
- **Framework**: Astro 5.x (static site generation)
- **Node**: v20 (as specified in GitHub Actions)
- **Styling**: Global CSS with custom design system (no framework)
- **Build output**: Static HTML/CSS/JS

### Project Structure
```
src/
├── pages/          # Route pages (index.astro is the homepage)
├── layouts/        # Layout wrapper (Layout.astro with SEO, fonts, analytics)
├── components/     # UI components (Nav, Hero, About, Services, etc.)
└── styles/         # Global CSS with design system variables

public/
├── images/         # Static images
└── .nojekyll       # Disables Jekyll processing on GitHub Pages
```

### Design System
Custom CSS design system defined in `src/styles/global.css` using CSS custom properties:
- **Color scheme**: Dark theme with accent color `#ff4d2e`
- **Typography**: Inter font family with fluid sizing
- **Variables**: All spacing, colors, and typography use CSS custom properties (e.g., `--color-accent`, `--space-8`, `--font-size-xl`)
- **Layout**: Max width of 1200px, 80px fixed nav height
- **Buttons**: `.btn`, `.btn-primary`, `.btn-outline` utility classes
- **Responsive**: Mobile-first breakpoint at 768px

### Page Architecture
- **Single page app**: All content on one page (`src/pages/index.astro`) with anchor navigation
- **Component-based**: Page composed of section components (Hero, About, Testimonials, Services, Contact)
- **Layout wrapper**: `Layout.astro` provides HTML structure, meta tags, Google Analytics, and Rybbit tracking

### Path Aliases
TypeScript configured with `@/*` alias mapping to `src/*` (see `tsconfig.json`)

### SEO & Analytics
- Open Graph and Twitter Card meta tags configured in `Layout.astro`
- Google Analytics: `G-QYC49P6HMB`
- Rybbit tracking: Site ID `fda22996a6f1`
- Canonical URL: https://sunbreakrunning.com/

## Important Notes
- No test suite configured
- No linting/formatting tools configured
- Images are in both `/images` (legacy) and `/public/images` directories
- Navigation is fixed/sticky with mobile hamburger menu
- All components use scoped Astro styles with inline `<style>` blocks
