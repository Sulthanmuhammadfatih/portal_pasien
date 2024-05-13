import 'package:flutter/material.dart';
import 'package:portal_pasien/screen/widget/pasien%20baru/listdoctor/widget/grid.view.dart';

class ListDoctor extends StatefulWidget {
  final int id;
  final String title;
  final String body;

  const ListDoctor({
    super.key,
    required this.id,
    required this.title,
    required this.body,

    // Factory ListDoctor.fromJson
  });

  @override
  State<ListDoctor> createState() => _ListDoctorState();
}

class _ListDoctorState extends State<ListDoctor> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pilih Dokter",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  GridViewDoctor(),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
