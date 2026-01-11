import 'package:flutter/material.dart';
import 'core/app_launcher.dart';
import 'core/storage/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(AppLauncher());
}
