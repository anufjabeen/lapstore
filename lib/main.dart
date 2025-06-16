import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lapstore/screens/authscreen.dart'; 
import 'package:lapstore/screens/home_screen.dart';
import 'package:lapstore/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBpYoHRmd1c6uXlRDsW5asW5NRDJ_lQ9_Q",
        authDomain: "lapstore-a3de4.firebaseapp.com",
        projectId: "lapstore-a3de4",
        storageBucket: "lapstore-a3de4.appspot.com",
        messagingSenderId: "698438982994",
        appId: "1:698438982994:web:7efe9af83003d3fcd5ee8b",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const LapStoreApp());
}

class LapStoreApp extends StatelessWidget {
  const LapStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LapStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ), 
      
      initialRoute: '/login',
      routes: {
        '/login': (context) => const AuthScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}




