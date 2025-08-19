
# flutter_assignment

## Overview

This project is a Flutter mobile application based on a provided Figma design, using GetX for state management. It demonstrates clean architecture, separation of View/Controller, and native permission handling.

## Installation & Run Instructions
0. **Install APK to android phone:**
   ```sh
   please go to the link to download and install apk on your android phone  
   https://drive.google.com/file/d/17_KH1dCF33EgCmTBuki61lyV-CGzHUZf/view?usp=sharing
   ```

1. **Clone the repository:**
   ```sh
   git clone https://github.com/t146150/FlutterAssignment.git
   cd flutter_assignment
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Add required assets:**
   - Update `pubspec.yaml`:
     ```yaml
     flutter:
       assets:
         - assets/images/
     ```
4. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure

```
lib/
  controllers/
    campaign_controller.dart
    dashboard_controller.dart
    myinfo_controller.dart
    permission_controller.dart
  views/
    splash_screen.dart
    dashboard_screen.dart
    campaign_screen.dart
    myinfo_screen.dart
  widgets/
    campaign_card.dart
    custom_button.dart
  main.dart
assets/
  images/
    pic1.png
    pic2.png
    pic3.png
    pic4.png
    pic5.png
    ...menu icons
```

## Implementation Assumptions & Decisions

- **State Management:** All state is managed using GetX (`Rx` variables, `Obx` widgets).
- **Architecture:** Clear separation between View (UI widgets/screens) and Controller (business logic/state).
- **Permissions:**
  - Camera permission is requested on dashboard entry and when the camera icon is tapped.
  - Gallery permission logic is included for future use.
  - Uses `permission_handler` package for runtime permission requests (Android/iOS).
- **UI:**
  - All screens follow the Figma design closely.
  - Campaign images and menu icons use local assets.
  - Menu items and campaign cards use consistent styling and dividers.
- **Reusable Widgets:** Common UI components (buttons, campaign cards) are separated in `widgets/`.
- **Assumptions:**
  - User name and campaign data are mocked for demonstration.
  - No backend/API integration; all data is local.
  - Only required permissions (camera/gallery) are handled; other permissions can be added similarly.
- **Decisions:**
  - Permission logic is refactored into a dedicated `PermissionController` for clarity and reuse.
  - All navigation uses named routes via GetX.
  - The app is designed to be easily extensible for additional features/screens.

## Dependencies

- flutter:
    sdk: flutter
- get: ^4.6.5
- permission_handler: ^11.0.0
