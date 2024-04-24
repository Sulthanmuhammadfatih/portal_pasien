import 'package:flutter/material.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/poli/widget/listview.dart';

class PoliPage extends StatelessWidget {
  const PoliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Text("Pilih Poli"),
            SizedBox(
              height: 15,
            ),
            ListViewPoli()
          ],
        ),
      )),
    );
  }
}
