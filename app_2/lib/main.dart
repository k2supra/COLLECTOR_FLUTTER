import 'Internal/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet adoption',
      debugShowCheckedModeBanner: false,
      home: Config(key: UniqueKey())
    );
  }
}
