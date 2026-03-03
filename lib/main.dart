import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScope(
      orientation: AppOrientationLock.portraitUp,
      designFrame: DesignFrame(width: 320, height: 812),
      scaleMode: ScaleMode.design,
      pixelDebug: false,
      gridCount: 12,
      enableDebugLogging: false,
      errorScreen: ErrorScreen.sifi,
      appBuilder: (MediaInfo layout) => DynamicHost(),
    );
  }
}
