import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                 child: ClipOval(
                  child: Image.network(""),
                 ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nama Pasien",
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
