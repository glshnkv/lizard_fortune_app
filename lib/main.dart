import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lizard_fortune_app/lizard_fortune_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(LizardFortuneApp());
}
