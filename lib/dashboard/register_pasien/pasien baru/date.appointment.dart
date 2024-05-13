import 'package:flutter/material.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/Custom/edit_text.dart';
import 'package:portal_pasien/dashboard/register_pasien/pasien%20baru/listdoctor/list.doctor.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController appoinntmennt = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black12)),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Metode Pembayaran",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Text("3/5")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white70),
                    child: EditText(
                        controller: appoinntmennt,
                        text: "Pilih Tanggal",
                        textInputType: TextInputType.name,
                        obscure: false),
                  ),
                  const SizedBox(
                    height: 560,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ListDoctor()));
                      },
                      text: 'Lanjutkan'
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
