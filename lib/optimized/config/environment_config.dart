final class EnvironmentConfig {
  EnvironmentConfig._();

  static const String targetPlatform =
      String.fromEnvironment('TARGET_PLATFORM');

  static const bool isAndroidPlatform = targetPlatform == 'android';
  static const bool isIosPlatform = targetPlatform == 'ios';
}
