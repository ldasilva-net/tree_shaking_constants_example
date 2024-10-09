# Flutter Tree Shaking with Constants example

This project demonstrates the power of tree shaking in Flutter using compile-time constants. It showcases how to optimize your Flutter app by removing unused code based on the target platform.

## Presentation
[View presentation](presentation.html)

## Video explanation (spanish)
[![View video explanation](video_cover.jpg)](https://youtu.be/Ur-iS3wR99k)

## Project Structure

The project consists of two main parts:

1. `lib/not_optimized/`: Contains the non-optimized version of the app.
2. `lib/optimized/`: Contains the optimized version of the app using compile-time constants.

Each part contains:
- `main.dart`: The entry point of the application.
- `utils/platform_notification.dart`: Defines platform-specific notification dialogs.

Additionally, the optimized version includes:
- `config/environment_config.dart`: Contains compile-time constants for platform detection.

## Features

- Displays different types of notifications based on the platform (iOS or Android).
- The optimized version uses compile-time constants to enable tree shaking, potentially reducing the app's size.
- Demonstrates how to structure code for effective tree shaking in Flutter.

## Setup and Running

1. Clone the repository:
   ```
   git clone <repository-url>
   cd tree_shaking_constants_example
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

## Testing Tree Shaking

To see the effects of tree shaking, we'll build both the optimized and non-optimized versions of the app and analyze their sizes.

### Building the Non-Optimized Version

1. Clean the project:
   ```
   flutter clean
   ```

2. Build the app bundle:
   ```
   flutter build appbundle \
     --target lib/not_optimized/main.dart \
     --release \
     --analyze-size \
     --target-platform=android-arm64
   ```

### Building the Optimized Version

1. Clean the project:
   ```
   flutter clean
   ```

2. Build the app bundle:
   ```
   flutter build appbundle \
     --target lib/optimized/main.dart \
     --release \
     --dart-define=TARGET_PLATFORM=android \
     --analyze-size \
     --target-platform=android-arm64
   ```

## Analyzing the Results

After building both versions, compare the analysis output. Look for:

1. Overall app bundle size
2. Size of specific parts of the app, especially those related to platform-specific code
3. Any unused code that may have been removed in the optimized version

The optimized version should have a smaller size due to the removal of unused iOS-specific code when building for Android.

## Code Explanation

### environment_config.dart (Optimized Version)

This file defines compile-time constants used for platform detection:

```dart
final class EnvironmentConfig {
  static const String targetPlatform =
      String.fromEnvironment('TARGET_PLATFORM');

  static const bool isAndroidPlatform = targetPlatform == 'android';
  static const bool isIosPlatform = targetPlatform == 'ios';
}
```

These constants are set at compile-time based on the `--dart-define` flag used during build.

### platform_notification.dart (Optimized Version)

This file uses the `EnvironmentConfig` to determine which notification to show:

```dart
void show() {
  if (EnvironmentConfig.isIosPlatform) {
    _showIosNotification();
  } else {
    _showAndroidNotification();
  }
}
```

The unused notification method (iOS or Android) should be removed during the build process thanks to tree shaking.

## Conclusion

This demo showcases how to leverage Flutter's tree shaking capabilities to create more efficient builds. By comparing the optimized and non-optimized versions, you can observe the potential benefits of using compile-time constants and structuring your code for effective tree shaking.

Remember that the actual impact of tree shaking can vary depending on the complexity of your app and how it's structured. Always profile and analyze your app's performance and size in real-world scenarios.
