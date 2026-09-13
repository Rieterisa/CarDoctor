# CarDoctor

iOS app that maps **VIN + OBD-II fault codes (DTC)** to likely failed parts, step-by-step repair guidance, an interactive **3D highlight**, and a **community** of repair videos.

Built with **SwiftUI**, **RealityKit**, **StoreKit 2**, and a local demo data layer ready to swap for **Firebase**.

> Dual purpose: App Store product (freemium) + portfolio piece for remote iOS roles.

## Features (MVP+)

- VIN decode (NHTSA vPIC + WMI) → **brand-specific** make/model/year (never a generic sedan)
- DTC catalog keyed by **make** (~1.7k entries across 18 brands, plus OEM-only codes)
- Diagnosis result: severity, part, repair steps, safety notes
- Procedural RealityKit car with highlighted faulty part (Pro)
- Community feed: filter by DTC, likes, comments
- Video upload with monthly quota + moderation status
- StoreKit 2 paywall (`com.cardoctor.pro.monthly` / `.yearly`) + demo unlock
- Sign in with Apple + Demo auth for local development

## Architecture

```
CarDoctor/
  App/           # App entry, RootView, AppModel DI
  Core/          # Models, Services, Validators, Theme
  Features/      # Auth, Diagnose, Scene3D, Community, VideoUpload, Profile, Paywall
  Resources/     # DTC seed JSON, strings, StoreKit config, privacy
firebase/        # Firestore + Storage rules & indexes
```

Services are `@Observable` and start with **in-memory / bundled seed** so the app runs without Firebase credentials. Replace implementations with Firestore/Storage when you add `GoogleService-Info.plist`.

**Brand-specific diagnosis:** VIN is decoded to a concrete make/model (NHTSA + WMI). DTC lookup is keyed by `code#make` — OEM codes (e.g. Honda `P1457`, Toyota `P1135`) only resolve for that brand. Rebuild the expanded catalog with `python scripts/build_brand_dtc_catalog.py`.

## Requirements

- macOS + **Xcode 15+**
- iOS **17+** Simulator or device
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) (`brew install xcodegen`)

> This repo was authored on Windows; generate the `.xcodeproj` on a Mac.

## Setup (Mac)

```bash
# 1) Generate Xcode project
brew install xcodegen   # if needed
xcodegen generate
open CarDoctor.xcodeproj

# 2) Set your Development Team in Signing & Capabilities

# 3) (Optional) Firebase
#    - Create a Firebase iOS app with bundle id com.cardoctor.app
#    - Download GoogleService-Info.plist into CarDoctor/
#    - Add FirebaseAuth / Firestore / Storage packages
#    - Deploy rules: firebase deploy --only firestore:rules,storage

# 4) Scheme → Run → StoreKit Configuration → Products.storekit (optional)
```

### Demo flow

1. Launch → **Continue with Demo**
2. Diagnose → VIN `1HGCM82633A004352` (Honda) or `4T1BE32K55U000001` (Toyota), DTC `P0300` (or Honda `P1457`)
   - Diagnosis text and sample codes are **per brand**, not a shared generic catalog
3. Open **3D** → paywall → **Unlock Pro (Demo)**
4. Community → like / comment
5. Upload a repair video (demo user is admin → publishes immediately)

## Monetization

| Free | Pro |
|------|-----|
| VIN + DTC text diagnosis | 3D part highlight |
| Read community | Higher video quota (30/mo vs 1) |
| | Unlimited diagnosis history (next) |

## Legal

In-app disclaimer: informational only — not a substitute for professional automotive service.

## Portfolio notes

Highlights for resumes / interviews:

- SwiftUI + Observation + async/await
- RealityKit procedural scene + interaction
- StoreKit 2 subscriptions
- Feature-first modular layout
- Firestore security rules designed for community moderation
- Unit tests for VIN/DTC parsers

## Roadmap

- Wire Firebase Auth / Firestore / Storage
- Real USDZ vehicle models per body style
- Admin moderation console
- Push notifications
- Bluetooth OBD-II live codes
