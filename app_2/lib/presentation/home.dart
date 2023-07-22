import 'package:app_2/presentation/second.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: NetworkImage('https://github.com/CleanRound/adoption_app/blob/master/assets/images/home.png?raw=true'), width: 500,),
            const Text('Ready to make a \nnew friend?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            const Text('Select your location and simply search \nfor pets near you.', style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600, ), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const Second())));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white, 
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'Get started >', 
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),),
              )
          ],
        ),
      ),
    );
  }
}