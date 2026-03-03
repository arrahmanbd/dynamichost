import 'package:dynamichostbd/src/core/themes/app_theme.dart';
import 'package:dynamichostbd/src/features/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DynamicHost extends ConsumerWidget {
  const DynamicHost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Host BD',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: const LoginPage(),
    );
  }
}
