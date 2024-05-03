import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portal_pasien/authentication/login/sign.in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCyQ2rbLGbHaHt0IvfCqGrob95LevY8KFg",
      appId: "1:291208993578:android:5f2374535f73f5f4fc1c53",
      messagingSenderId: "291208993578",
      projectId: "123456789",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Portal Pasien',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginPage());
  }
}
