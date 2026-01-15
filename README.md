# Sunbreak Running

A modern, single-page marketing website for Sunbreak Running, a Pacific Northwest running coaching service. Built with Astro and deployed to GitHub Pages.

🌐 **Live Site**: [sunbreakrunning.com](https://sunbreakrunning.com)

## About

Sunbreak Running provides personalized running coaching with a focus on injury prevention and performance optimization for runners of all levels.

## Tech Stack

- **Framework**: [Astro](https://astro.build) 5.x (static site generation)
- **Styling**: Custom CSS design system with CSS custom properties
- **Deployment**: GitHub Pages (automated via GitHub Actions)
- **Analytics**: Google Analytics, Rybbit tracking

## Getting Started

### Prerequisites

- Node.js v20 or higher
- npm

### Installation

```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

The site will be available at `http://localhost:4321`

## Development

### Available Commands

```bash
npm run dev      # Start development server with hot reload
npm run build    # Build for production (output to dist/)
npm run preview  # Preview production build locally
```

### Project Structure

```
src/
├── pages/          # Routes (index.astro = homepage)
├── layouts/        # Layout wrapper with SEO & analytics
├── components/     # Reusable UI components
│   ├── Nav.astro
│   ├── Hero.astro
│   ├── About.astro
│   ├── Testimonials.astro
│   ├── Services.astro
│   ├── Contact.astro
│   └── Footer.astro
└── styles/         # Global CSS design system

public/
└── images/         # Static images
```

### Design System

The site uses a custom design system defined in `src/styles/global.css`:

- **Dark theme** with accent color `#ff4d2e`
- **Typography**: Inter font family
- **CSS Variables**: All spacing, colors, and typography use custom properties
- **Responsive**: Mobile-first with breakpoint at 768px
- **Components**: Scoped styles within each `.astro` component

### Path Aliases

The project uses `@/*` as an alias for `src/*` (configured in `tsconfig.json`).

## Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the `main` branch.

### Automatic Deployment

- Triggered by: Push to `main` branch
- Workflow: `.github/workflows/deploy.yml`
- Target: https://sunbreakrunning.com

### Manual Deployment

You can also trigger a deployment manually:

1. Go to the Actions tab in GitHub
2. Select "Deploy to GitHub Pages"
3. Click "Run workflow"

## Architecture Notes

- **Single-page design**: All content on one page with anchor navigation
- **Static generation**: Pre-rendered HTML for optimal performance
- **No build tools for CSS**: Plain CSS with modern features
- **Component-based**: Modular Astro components with scoped styles

## SEO & Analytics

- Open Graph and Twitter Card meta tags
- Google Analytics: `G-QYC49P6HMB`
- Rybbit tracking: Site ID `fda22996a6f1`
- Canonical URL configured

## License

See [LICENSE](LICENSE) file for details.
