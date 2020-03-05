import 'package:flutter/material.dart';

class AppUtils {
  static bool isIOSPlatform(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.iOS;

  static bool isAndroidPlatform(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.android;
}
