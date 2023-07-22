import 'package:flutter/material.dart';
import 'package:to_do_final/presentation/pages/help.dart';



class NavBar extends StatefulWidget {
  const NavBar({Key? key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_outline_outlined),
            title: const Text('About'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const Help())));
            },
          ),
        ],
      ),
    );
  }
}