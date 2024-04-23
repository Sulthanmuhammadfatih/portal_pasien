import 'package:flutter/material.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/listdoctor/widget/grid.view.dart';

class ListDoctor extends StatefulWidget {
  ListDoctor({Key? key}) : super(key: key);

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
