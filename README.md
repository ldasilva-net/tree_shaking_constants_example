# tree_shaking_constants_example


flutter clean

flutter build appbundle \
  --target lib/not_optimized/main.dart \
  --release \
  --analyze-size \
  --target-platform=android-arm64


flutter clean

flutter build appbundle \
  --target lib/optimized/main.dart \
  --release \
  --dart-define=TARGET_PLATFORM=android \
  --analyze-size \
  --target-platform=android-arm64