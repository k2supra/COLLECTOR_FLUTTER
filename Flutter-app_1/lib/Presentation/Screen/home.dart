import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Map<String, dynamic>> me = [
    {'emoji': Icons.person, 'text': 'Name: Andrew'},
    {'emoji': Icons.calendar_today, 'text': 'Age:    16         '},
  ];
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 250,
            child: Image(image: AssetImage("assets/images/mee.jpg")),
          ),
          Padding(
            padding:const  EdgeInsets.only(left: 10, top: 250),
            child: Column(
              children: [
                for (var m in me)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(m['emoji']),
                        ),
                      const SizedBox(width: 10,),
                      Text(m['text']),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
    /*Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment:Alignment.topLeft, child: Image.asset("assets/images/mee.jpg", height: 250,),),
            
            for (var m in me)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(m['emoji']),
                  ),
                  const SizedBox(width: 8,),
                  Text(m['text']),
                ],
              ),
              //Image.asset("assets/images/mee.jpg", height: 250,),
          ],
        ),
      )
    );*/
  }
}