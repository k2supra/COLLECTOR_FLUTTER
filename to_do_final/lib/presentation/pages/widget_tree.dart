import 'package:flutter/material.dart';
import 'package:to_do_final/internal/home.dart';
import 'package:to_do_final/presentation/pages/auth.dart';
import 'package:to_do_final/presentation/pages/forauth.dart';
import 'login_register.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //return ForAuth();
          return const Home();
        } else
        {
          return const Login();
        }
      }
    );
  }
}