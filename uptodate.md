# OptiLife

OptiLife is a Flutter wellness application for discovering lifestyle goals, fitness preferences, dietary needs, available time, and other personal constraints.

## Features

- Splash and onboarding flow
- Sign-in and sign-up screens
- Lifestyle goal and available-time selection
- Training environment, equipment, budget, and dietary preference wizard
- Food availability and fitness baseline setup
- Home dashboard with meals, hydration, calorie progress, schedules, and recovery tips
- State management for wizard selections with `flutter_bloc`
- Declarative app navigation with `go_router`

## Technology

- Flutter
- Dart
- `flutter_bloc` / `bloc`
- `go_router`
- `intl`

## Requirements

- Flutter SDK
- Dart SDK
- A supported Android, iOS, or web development environment

This project uses Dart SDK constraint `^3.13.3`.

## Getting Started

From the project root:

```powershell
flutter pub get
flutter run
```

To run a specific platform:

```powershell
flutter run -d windows
flutter run -d chrome
flutter run -d android
```

## Common Commands

```powershell
# Format source files
dart format .

# Analyze the project
flutter analyze

# Run tests
flutter test

# Check package versions
flutter pub outdated
```

## Project Structure

```text
lib/
|-- app.dart                    # App configuration and root BlocProvider
|-- main.dart                   # Application entry point
|-- core/
|   |-- router/                 # GoRouter route definitions
|   |-- theme/                  # App colors and theme
|   |-- constants/              # Shared constants and enums
|   `-- error/                  # Exception and failure definitions
`-- features/
    |-- auth/                   # Sign-in and sign-up UI
    |-- onboarding/             # Splash and onboarding screens
    |-- progress/               # Goals and available-time selection
    |-- wizard/                 # Main personalization wizard
    |-- final_wizard/           # Fitness, food, and final preference setup
    `-- home/                   # Dashboard and home widgets
assets/
`-- images/                     # App images and icons
test/
`-- widget_test.dart            # Flutter widget test
```

## Application Flow

The app starts at `/splash`, continues through `/onboarding`, and provides sign-in and sign-up routes. The personalization flow uses routes for goals, available time, training environment, equipment, budget, diet, food, fitness baseline, and the kitchen setup. The main dashboard is available at `/home`.

The central router is defined in `lib/core/router/app_router.dart`, and wizard state is maintained by `SelectionCubit`.

## Assets

App assets are declared in `pubspec.yaml` under `assets/images/`. Flutter has access to the images in that directory, but each image must be referenced by its exact path in source code.

## Testing

Widget tests are located in `test/widget_test.dart`. Run them with:

```powershell
flutter test
```
