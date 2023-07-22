import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/aplication/app.dart';

void main() {
  runApp(const ProviderScope(child: Application()));
}
