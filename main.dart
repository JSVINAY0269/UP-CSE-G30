import 'package:flutter/material.dart';
import 'package:site_manager/features/skeleton/presentation/skeleton.dart';
import 'package:site_manager/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const SiteManagerApp());
}
