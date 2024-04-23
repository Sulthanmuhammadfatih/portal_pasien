import 'package:flutter/material.dart';

class RecentFragment extends StatefulWidget {
  const RecentFragment({super.key});

  @override
  State<RecentFragment> createState() => _RecentFragmentState();
}

class _RecentFragmentState extends State<RecentFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              child: const Text(
                "Recent",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              
            )
          ],
        ),
      )),
    );
  }
}