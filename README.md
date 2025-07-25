# my_ssr_app

# 🔗 URL Shortener – Dart Frog + Jinja

This is a simple **server-side rendered (SSR)** URL Shortener built using [Dart Frog](https://dartfrog.vgv.dev) and [Jinja](https://pub.dev/packages/jinja) templating engine.

It was inspired by a workshop I attended at the **API Conference** titled:  
**"Server-Side Rendering with Dart: Building Dynamic Web Applications"**  
facilitated by [Samuel Odabo](https://github.com/Samuel-odabo). That session motivated me to explore the Dart backend ecosystem – and this was the result!

---

## ✨ Features

- ✅ Built with **Dart Frog** – a modern backend framework for Dart.
- 🎨 Uses **Jinja** for server-side templating.
- 🔗 Basic URL shortening (currently works on `localhost`).
- 🖥️ SSR-enabled pages (no frontend JS frameworks).
- 🌍 Deployed on [Dart Frog Globe](https://dartfrog.vgv.dev/docs/deployment/globe).

> **Note:** No database is connected yet — so shortened links work only during a session.

---

## 🚀 Getting Started

### Prerequisites

- Dart SDK `>=3.0.0`
- `dart_frog_cli` installed globally:
  ```bash
  dart pub global activate dart_frog_cli

##Clone & Run Locally
git clone https://github.com/Topzee001/building-web-application-with-dart-frog.git
cd building-web-application-with-dart-frog

# Run in dev mode
dart_frog dev

## Build for Production
dart_frog build
dart build/bin/server.dart

## 📁 Project Structure
.
├── routes/
│   ├── index.dart         # Home route
│   └── shorten.dart       # Shorten URL route
├── templates/             # Jinja templates
├── build/                 # Compiled server files (gitignored)
├── public/                # Static files
└── README.md

 ## To Do

 - Connect to a persistent database (e.g., Supabase, Firebase, PostgreSQL)
 - Redirect logic for shortened links
 - Copy-to-clipboard button
 - Track click analytics

## Acknowledgements

- Workshop by @Mastersam07
- Dart Frog
- Jinja Dart Package


[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

An example application built with dart_frog

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis