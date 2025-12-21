# Agentic Workflow: Sunbreak Rust Rewrite

This document serves as the "Central Brain" for the AI-driven rewrite of SunbreakRunning.com.
It defines the protocol for a generic "Central Agent" to dispatch tasks to "Worker Agents" (smaller models).

## 1. The Protocol

### Roles
-   **Central Agent**: Reads this document, picks the next `[ ]` task, creates a branch, and prompts a Worker Agent.
-   **Worker Agent**: Receives a specific Context and Goal. Lives entirely within a `feature/` branch.
    -   *Constraint*: Can only edit files in `src/components/{task_name}.rs` and its specific CSS unless told otherwise.
-   **Reviewer (User/CI)**: Merges the branch back to `main`.

### Workflow Loop
1.  **Select**: Pick an unassigned task from [Component Registry](#3-component-registry).
2.  **Branch**: Create `git checkout -b feature/{component_name}`.
3.  **Prompt**: Generate a prompt for the Worker Agent containing:
    -   **Source**: The relevant snippet from `index.html` (referenced by line numbers).
    -   **Destination**: The file `src/components/{component_name}.rs`.
    -   **Style Guide**: "Leptos, Functional Components, signal-based state if needed, Pure CSS classes".
4.  **Implement**: Worker Agent writes the code.
5.  **Verify**: Worker Agent runs `cargo test`.
6.  **PR**: Submit for review.

## 2. Architecture & Standards

-   **Stack**: Rust, Leptos (SSR).
-   **Styling**:
    -   Global styles in `style/main.css` (port of assets/css/main.css).
    -   Component specific tweaks can use `style` attribute or localized classes.
    -   *Rule*: Prefer standard CSS classes found in the original `main.css` to maintain visual parity.
-   **Images**: All images currently live in `public/images/`.

## 3. Component Registry

### Phase 1: Foundation
- [ ] **Project Scaffold** <!-- id: scaffold -->
    -   *Objective*: Initialize `Cargo.toml`, `src/main.rs`, `src/app.rs`, `src/lib.rs`.
    -   *Context*: Standard Leptos SSR setup.

### Phase 2: Components (The "Small Pieces")

#### Navigation
- [ ] **NavBar** <!-- id: navbar -->
    -   *Source*: `index.html` lines 322-333 (`<nav id="nav">...`)
    -   *Target*: `src/components/navbar.rs`
    -   *Props*: Active tab name.

#### Hero & Intro
- [ ] **IntroHeader** <!-- id: intro -->
    -   *Source*: `index.html` lines 313-319 (`<div id="intro">...`)
    -   *Target*: `src/components/intro.rs`

#### Main Content Area
- [ ] **AboutSection** <!-- id: about -->
    -   *Source*: `index.html` lines 339-370 (`<article class="post featured">...`)
    -   *Target*: `src/components/about.rs`
    -   *Notes*: Contains an image carousel. This is a complex task. Might need subdivision or a smart "Carousel" sub-component.

- [ ] **PhilosophySection** <!-- id: philosophy -->
    -   *Source*: `index.html` lines 373-388 (`<section id="philosophy">...`)
    -   *Target*: `src/components/philosophy.rs`

- [ ] **TestimonialsSection** <!-- id: testimonials -->
    -   *Source*: `index.html` lines 391-444 (`<section id="testimonials">...`)
    -   *Target*: `src/components/testimonials.rs`
    -   *Notes*: Also contains a carousel/slider.

- [ ] **ServicesSection** <!-- id: services -->
    -   *Source*: `index.html` lines 447-487 (`<section id="services">...`)
    -   *Target*: `src/components/services.rs`

#### Footer & Layout
- [ ] **ContactForm** <!-- id: contact -->
    -   *Source*: `index.html` lines 494-524 (`<footer id="contact">...`)
    -   *Target*: `src/components/contact.rs`
    -   *Notes*: Needs to preserve the `formspree` action or replace with a Server Action.

- [ ] **FooterMain** <!-- id: footer -->
    -   *Source*: `index.html` line 489
    -   *Target*: `src/components/footer.rs`
    -   *Notes*: Copyright info, script imports (replace with Leptos `<Script>`).

## 4. Prompt Templates

### For Worker Agent
```text
You are a Worker Agent. Your task is to port a specific HTML section to a Rust Leptos component.

**Context**:
- Project: SunbreakRunning (Rust/Leptos)
- Component Name: {COMPONENT_NAME}
- Target File: src/components/{COMPONENT_NAME}.rs

**Input HTML**:
{INSERT_HTML_SNIPPET}

**Requirements**:
1. Create a `#[component]` named `{COMPONENT_NAME}`.
2. Use the `view!` macro to return the HTML.
3. Preserve ALL CSS classes exactly.
4. Replace `class="..."` with `class="..."` (Leptos supports strict class attributes, but `class` works).
5. Ensure images point to `/images/...`.
6. Return ONLY the Rust code for this file.
```
