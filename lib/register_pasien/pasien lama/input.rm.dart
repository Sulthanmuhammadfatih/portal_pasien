import 'package:flutter/material.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/Custom/edit_text.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/type.payment.dart';

class InputRM extends StatelessWidget {
  const InputRM({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputNomerRM = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: double.infinity,
                  child: const Text(
                    "Pasien Lama",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      EditText(
                        controller: inputNomerRM,
                        text: "Masukan Nomer RM Anda",
                        textInputType: TextInputType.number,
                        obscure: false,
                      ),
                      CustomButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PaymentType()));
                          },
                          text: "Lanjutkan")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 