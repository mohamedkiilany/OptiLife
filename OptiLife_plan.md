# AI Lifestyle Optimizer — Project Plan & Getting Started

## 1. Product in One Line
An AI app that builds fitness + nutrition plans around the user's **real constraints**: time, budget, equipment, and ingredients.

**Core loop:** Profile (constraints) -> AI generates plan -> User follows daily plan -> Logs progress -> AI adapts.

---

## 2. Tech Stack

| Layer | Choice |
|---|---|
| UI | Flutter / Dart |
| State | Bloc / Cubit (`flutter_bloc`) |
| Auth | Firebase Authentication |
| Database | Cloud Firestore |
| Networking | Dio + Interceptors |
| AI | LLM API (Gemini or Claude) called through a backend proxy |
| Nutrition data | Open Food Facts / USDA FoodData Central / Edamam |
| Local storage | Hive (cached plans), SharedPreferences (settings, onboarding flag) |
| DI | `get_it` |
| Routing | `go_router` |
| Models | `freezed` + `json_serializable` |
| Errors | `dartz` or `fpdart` (Either) |
| Testing | `flutter_test`, `bloc_test`, `mocktail` |

> **Important security note:** never put the AI API key inside the Flutter app. Call the AI through a **Firebase Cloud Function** (or small Node.js server) that holds the key. This also fits your Node.js skills.

---

## 3. Architecture: Feature-First Clean Architecture

Each feature has 3 layers: **data -> domain -> presentation**.

```
lib/
├── main.dart
├── app.dart                      # MaterialApp.router, theme
├── core/
│   ├── di/injection.dart         # get_it setup
│   ├── network/
│   │   ├── dio_client.dart
│   │   └── interceptors/         # auth, logging, retry, error
│   ├── error/                    # failures, exceptions
│   ├── router/app_router.dart
│   ├── theme/                    # colors, text styles, theme
│   ├── constants/                # enums: Goal, TimeSlot, Budget...
│   ├── utils/
│   └── widgets/                  # shared buttons, chips, cards
├── features/
│   ├── auth/
│   │   ├── data/ (datasource, models, repo_impl)
│   │   ├── domain/ (entities, repo, usecases)
│   │   └── presentation/ (cubit, pages, widgets)
│   ├── onboarding/               # intro slides + profile wizard
│   ├── profile/                  # user constraints & settings
│   ├── workout/                  # plan, details, session, "What can I do today?"
│   ├── nutrition/                # meal plan, recipe, alternatives, "What can I make?"
│   ├── shopping/                 # shopping list
│   ├── schedule/                 # daily timeline
│   ├── assistant/                # AI chat
│   ├── progress/                 # weight, workouts, nutrition logs, charts
│   └── home/                     # dashboard
└── l10n/                         # (optional) Arabic / English
test/
├── features/...
└── helpers/
```

---

## 4. Core Data Models

### UserProfile (`users/{uid}`)
```
goal: loseWeight | gainMuscle | maintain | improveFitness
availableMinutes: 10 | 20 | 30 | 45
environments: [home, gym, outdoors]
equipment: [none, dumbbells, bands, gym]
budget: low | medium | high
dietPreferences: [vegetarian, halal, ...]
dislikedFoods: [..]
fitnessLevel: beginner | intermediate | advanced
age, heightCm, weightKg, gender
pantry: [ingredient ids]
createdAt, updatedAt
```

### Plan (`users/{uid}/plans/{planId}`)
```
generatedAt, constraintsSnapshot
days: [
  { date, workout: Workout, meals: [Meal], shoppingList: [Item], schedule: [Slot] }
]
```

### Collections
```
users/{uid}
users/{uid}/plans/{planId}
users/{uid}/logs/weight/{id}        # value, date
users/{uid}/logs/meals/{id}
users/{uid}/logs/workouts/{id}      # duration, calories, rating
users/{uid}/chats/{messageId}
ingredients/{id}                     # (optional) price + nutrition catalog
```

---

## 5. AI Design (the key part)

The AI is a **decision layer**. Always ask it to return **strict JSON** so the app can parse it into models.

**Flow:** App -> Cloud Function (adds system prompt + key) -> LLM -> JSON -> App validates -> saves to Firestore.

**System prompt idea:**
```
You are a wellness planner. Create a plan strictly within the user's constraints.
Never exceed available time, never use equipment the user doesn't have, respect budget
and dietary restrictions. Return ONLY valid JSON matching this schema: { ... }
```

**AI use cases (one endpoint/prompt each):**
1. `generatePlan` — full weekly plan from profile.
2. `suggestWorkout` — "What can I do today?" (time + energy).
3. `suggestMeals` — "What can I make?" (ingredients list).
4. `cheaperAlternatives` — swap expensive ingredients.
5. `chat` — assistant with the user's profile + current plan as context.

**Tips:** validate the JSON with a model parser, retry once on failure, cache results in Hive, and keep prompts short to save cost. Add a small disclaimer that this is not medical advice.

---

## 6. Build Phases (Roadmap)

### Phase 0 — Setup (Day 1-2)
- Create Flutter project, folders, theme, router, DI.
- Create Firebase project, connect with FlutterFire CLI.
- Set up Git repo and branch strategy.

### Phase 1 — UI with mock data (Week 1-2)
- Build all screens from the Stitch designs using **fake data**.
- Shared widgets: option card, pill chip, constraint badge, meal card, workout card.
- Goal: whole app clickable before any backend work.

### Phase 2 — Auth & Profile (Week 3)
- Firebase Auth (email + Google).
- Splash -> onboarding -> login/register -> wizard -> save profile to Firestore.
- Auth guard in the router.

### Phase 3 — AI Plan Generation (Week 4-5)
- Cloud Function proxy + `generatePlan`.
- Dio client + interceptors.
- Plan generation screen, save and display the plan (workout, meals, schedule, shopping list).

### Phase 4 — Smart Features (Week 6)
- "What Can I Do Today?" and "What Can I Make?".
- Budget alternatives.
- Nutrition API integration for accurate macros.

### Phase 5 — Tracking & Assistant (Week 7)
- Logs (weight, meals, workouts) + charts (`fl_chart`).
- Active workout session with timers, completion screen, streaks.
- AI chat assistant.

### Phase 6 — Polish & Release (Week 8)
- Offline cache (Hive), empty/error states, notifications (`flutter_local_notifications`).
- Unit + widget tests, Firestore security rules, app icon, splash.
- Build release APK/AAB.

---

## 7. Getting Started — Step by Step

### Step 1: Create the project
```bash
flutter create ai_lifestyle_optimizer --org com.yourname
cd ai_lifestyle_optimizer
```

### Step 2: Add dependencies (`pubspec.yaml`)
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5
  get_it: ^7.7.0
  go_router: ^14.0.0
  dio: ^5.4.0
  firebase_core: ^3.0.0
  firebase_auth: ^5.0.0
  cloud_firestore: ^5.0.0
  google_sign_in: ^6.2.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.0
  freezed_annotation: ^2.4.0
  json_annotation: ^4.9.0
  fpdart: ^1.1.0
  fl_chart: ^0.68.0
  flutter_local_notifications: ^17.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  bloc_test: ^9.1.7
  mocktail: ^1.0.3
  build_runner: ^2.4.0
  freezed: ^2.5.0
  json_serializable: ^6.8.0
  flutter_lints: ^4.0.0
```
Then run `flutter pub get`. (Check the latest versions on pub.dev; the numbers above are a starting point.)

### Step 3: Connect Firebase
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
In the Firebase console enable: **Authentication** (Email + Google) and **Cloud Firestore**.

### Step 4: Create the folder structure
Create the folders from section 3 (start with `core/` and `features/auth`, `features/onboarding`, `features/home`).

### Step 5: Core setup (add these files first)
1. `core/theme/app_colors.dart` -> green `#22C55E`, teal `#0F766E`, etc. from the Stitch design.
2. `core/theme/app_theme.dart` -> `ThemeData` using those colors.
3. `core/constants/enums.dart` -> `Goal`, `TimeSlot`, `Environment`, `Equipment`, `Budget`, `FitnessLevel`.
4. `core/di/injection.dart` -> `GetIt.instance` registrations.
5. `core/router/app_router.dart` -> routes for splash, onboarding, login, register, wizard, home.
6. `core/network/dio_client.dart` + interceptors (auth token, logging, error mapping).
7. `main.dart` -> `Firebase.initializeApp()`, `Hive.initFlutter()`, DI init, `runApp`.

### Step 6: Build screens with mock data
For each screen: create the `page`, then widgets, then a `Cubit` that emits mock states
(`initial / loading / success / error`). Replace mock data with real repositories later.

### Step 7: Build features in this order
`onboarding wizard` -> `auth` -> `profile` -> `home` -> `workout` -> `nutrition` -> `shopping` -> `schedule` -> `assistant` -> `progress`.

### Step 8: Add the AI backend
```bash
npm install -g firebase-tools
firebase login
firebase init functions     # choose TypeScript or JavaScript
```
Create one callable function per AI use case, store the API key with
`firebase functions:secrets:set AI_API_KEY`, and call it from Flutter.

---

## 8. State Management Pattern (Cubit example)

Each feature cubit uses a single state class:
```
status: initial | loading | success | failure
data: ...
errorMessage: ...
```
Flow: `Page -> Cubit -> UseCase -> Repository -> DataSource (Firestore / Dio)`.

---

## 9. Firestore Security Rules (starting point)
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{uid}/{document=**} {
      allow read, write: if request.auth != null && request.auth.uid == uid;
    }
  }
}
```

---

## 10. Testing Plan
- **Unit tests:** use cases, repositories (mock data sources), plan JSON parsing.
- **Bloc tests:** every cubit with `bloc_test`.
- **Widget tests:** wizard flow, login form validation, home dashboard.
- Aim for tests on the plan-parsing and constraint logic first; that's where bugs hurt most.

---

## 11. Git Workflow
- Branches: `main`, `develop`, `feature/<name>`.
- Commit style: `feat: add goal selection step`, `fix: ...`.
- Optional: GitHub Actions running `flutter analyze` and `flutter test` on each push.

---

## 12. MVP Scope (what to cut if time is short)
**Must have:** Auth, constraints wizard, AI weekly plan (workout + meals), Home, shopping list, basic progress log.
**Nice to have:** "What Can I Make?", chat assistant, charts, notifications.
**Later:** barcode scanning, wearables, social features, premium plans.

---

## 13. Risks & Notes
- **AI cost and latency:** cache plans, generate weekly (not daily), keep prompts short.
- **Invalid AI output:** always validate JSON; fall back to a retry or a default template.
- **Health safety:** add a "not medical advice" disclaimer and avoid extreme calorie targets.
- **Nutrition data accuracy:** prefer API values over AI-estimated macros.
- **Prices vary by country:** let the user set currency; keep budget levels relative.

---

## 14. Immediate Next Actions
1. Generate all screens in Stitch using `stitch_ui_prompts.md`.
2. Create the Flutter project and Firebase connection (Steps 1-3).
3. Set up `core/` (theme, router, DI) — Step 5.
4. Build the onboarding wizard with mock data as the first feature.
