# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

SunbreakRunning is a static website hosted via GitHub Pages at sunbreakrunning.com. This repository currently contains minimal setup files and serves as the foundation for a running-related website.

## Repository Structure

This is a GitHub Pages repository with:
- Static hosting configuration via CNAME file
- GNU GPL v3 licensed content
- Minimal initial setup awaiting content development

## Common Commands

### Git Operations
```powershell
# Check repository status
git status

# View commit history
git --no-pager log --oneline

# Push changes to deploy to GitHub Pages
git add .
git commit -m "Your commit message"
git push origin main
```

### GitHub Pages Deployment
- Changes to `main` branch automatically deploy to sunbreakrunning.com
- CNAME file configures custom domain
- No build process required for static files

## Development Guidelines

### File Management
- Add HTML, CSS, JavaScript, and assets directly to root or organized subdirectories
- Ensure all static assets use relative paths for GitHub Pages compatibility
- Test locally before pushing to avoid broken deployments

### Domain Configuration
- Custom domain configured via `CNAME` file pointing to sunbreakrunning.com
- DNS must be configured externally to point to GitHub Pages servers

## Future Development

As this repository grows, consider adding:
- `index.html` for the main page
- CSS framework or custom stylesheets in `css/` directory
- JavaScript functionality in `js/` directory
- Images and media in `assets/` or `images/` directory
- Navigation and page structure for a multi-page site

## Licensing

This project is licensed under GNU General Public License v3 - see LICENSE file for details.