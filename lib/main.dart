import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tp9/blog_page.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp app = await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBW6IyJenzBqlAfj2xkQ3xYc-RXdowYsos",
        authDomain: "flutter-tp9-41b69.firebaseapp.com",
        projectId: "flutter-tp9-41b69",
        storageBucket: "flutter-tp9-41b69.appspot.com",
        messagingSenderId: "996653798354",
        appId: "1:996653798354:web:bb9ce1c97df261a6516e0b"
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BlogPage(),
    );
  }

}

