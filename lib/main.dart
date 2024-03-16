import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: 'first-proj-24d5d',
      appId: '1:1085939915040:android:21621a48b8725e3d39df45',
      apiKey: 'AIzaSyDi1-vzJN0JT26oWK6zs-DE6BS2oWLv3A',
      messagingSenderId: '1085939915040',
      databaseURL:
          'https://first-proj-24d5d-default-rtdb.asia-southeast1.firebasedatabase.app',
      storageBucket: 'first-proj-24d5d.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Signup Page',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
