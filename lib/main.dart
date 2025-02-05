import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'presentation/pages/counter_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MaterialApp(home: CounterPage()));
}
