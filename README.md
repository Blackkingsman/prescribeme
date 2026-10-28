# PrescribeMe

A Flutter mobile app for managing your health in one place: book appointments, track prescriptions, and keep your medical records.

Built in Fall 2019 with Upasna Dadabhai, across four agile sprints.

> Built by hand in 2019, before AI coding tools. Left as originally written.

## Features

- Sign up and log in (Firebase Auth)
- Appointments: schedule and view them
- Prescriptions: track current medications
- Medical records page
- User profile

## Tech

- **Flutter / Dart**, with an MVC-style layout (`lib/Model`, `lib/View`, `lib/Controller`)
- **Firebase Auth** and **Cloud Firestore**
- `flutter_datetime_picker`, `cached_network_image`, `flutter_staggered_grid_view`

## Project layout

```
lib/View/        frontpage, signup, home, appointments, prescriptions, medical, profile
lib/Controller/  one controller per page, plus myfirebase.dart (Firebase calls)
lib/Model/       data models
```

## History

The app began from a book-review starter template, which is why the package is still named `bookreview`. Each sprint lives on its own branch (`sprint1` to `sprint4`); `master` has the final sprint.

## Running it

This targets a 2019 Flutter SDK (Dart `>=2.1.0 <3.0.0`). A current Flutter version will need dependency upgrades and its own Firebase project:

```bash
flutter pub get
flutter run
```
