import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About'),
      ),
      body: Center(
        child: ListView(
          children: const [
            ListTile(
              title: Text('How to create task?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('Press on elevated button with plus (+) and enter name with description. You can also pick a date with time of deadlie', style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('How to edit task?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('Press on task and you can be able to change every position in it', style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('How to delete task?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('There are 2 variants of deleting. 1 - If your task in "To do" you can swipe to the left border(works only in "To do"). 2 - Press on trash backet on task what you eant to delete, after you can confirm or decline deleting.', style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('How to put my task in "Done" task?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('Swipe to the right border. If you swipe from "To do" you will move it to "In progress". You can also move them back. Just swipe to the left.', style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('How to switch light/dark mode?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('Turn of/on dark mode on your phone.', style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('How many tasks can I create?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('Infinity', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}