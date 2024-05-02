import 'package:flutter/material.dart';

class RecentFragment extends StatefulWidget {
  const RecentFragment({super.key});

  @override
  State<RecentFragment> createState() => _RecentFragmentState();
}

class _RecentFragmentState extends State<RecentFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              child: Text(
                "Recent",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'nama',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'tujuan poli',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black26),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
