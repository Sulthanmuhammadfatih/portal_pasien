import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/data.pribadi.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/dropdown.list.kecamatan.dart';

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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          useMaterial3: true,
        ),
        home: RegisterPasienPage());
  }
}
