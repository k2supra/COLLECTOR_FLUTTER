import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/list_character.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: ListCharacter(),
      ),
    );
  }
}