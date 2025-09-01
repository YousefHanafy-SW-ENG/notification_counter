import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_counter/core/helpers/preferences_helper.dart';
import 'package:notification_counter/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  runApp(ProviderScope(child: const MyApp()));
}
