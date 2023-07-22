import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_final/presentation/pages/widget_tree.dart';

import 'package:to_do_final/internal/home.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(
    name: 'first DB',
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBPtAy1LV1-rOtPZ3HoXm5YJplhDb1euJk', 
      appId: '1:993901873868:android:2f08d86affd3c0f3889069', 
      messagingSenderId: '993901873868', 
      projectId: 'todoflutter-fee34',
      databaseURL: 'https://todoflutter-fee34-default-rtdb.europe-west1.firebasedatabase.app',
    )
  );
  await Firebase.initializeApp(
    name: 'second DB',
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDMki6jnA5sJKubUFUFqugojLlMnRB6Vqg', 
      appId: '1:1062312349415:android:aa7524b4c48a62c6219c42', 
      messagingSenderId: '1062312349415', 
      projectId: 'inprogressflutter',
      databaseURL: 'https://inprogressflutter-default-rtdb.europe-west1.firebasedatabase.app',
    )
  );
  await Firebase.initializeApp(
    name: 'third DB',
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDnOOExamIpUc-HjDYMOJd9TgvqZJP3cdw', 
      appId: '1:1039629825521:android:bd3f05161c361225a14050', 
      messagingSenderId: '1039629825521', 
      projectId: 'doneflutter',
      databaseURL: 'https://doneflutter-default-rtdb.europe-west1.firebasedatabase.app',
    )
  );
  await Firebase.initializeApp(
    name: 'forth DB',
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAMkJESKB35LIQPJ92bKn9SM_XBD9L5BIk', 
      appId: '1:960739393696:android:9fac9105ce8cb7489d09c5', 
      messagingSenderId: '960739393696', 
      projectId: 'declinedflutter',
      databaseURL: 'https://declinedflutter-default-rtdb.europe-west1.firebasedatabase.app',
    )
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: const WidgetTree(),
    home: Home(key: UniqueKey()),
  ));
}
