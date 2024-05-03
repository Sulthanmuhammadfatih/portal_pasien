import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/data.pribadi.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/date.appointment.dart';
import 'package:portal_pasien/Custom/custom.outline.button.dart';
import 'package:portal_pasien/Custom/custom_button.dart';

class PaymentType extends StatefulWidget {
  const PaymentType({super.key});

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  @override
  Widget build(BuildContext context) {
    List<String> typePayment = ['Bpjs', 'Tunai', 'Asuransi'];

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
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: OutlineButtonBack(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPasienPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const Text(
                    "Metode Pembayaran",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Text("2/5")
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
                    child: DropdownButtonFormField2(
                      items: typePayment
                          .map((value) => DropdownMenuItem(child: Text(value)))
                          .toList(),
                      validator: (value) {
                        if (value) {
                          return 'Tolong Di Isi Form Ini. ';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      onSaved: (value) {},
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  const SizedBox(
                    height: 560,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomButton(
                        onPressed: () {
                          setState(
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Appointment()));
                            },
                          );
                        },
                        text: 'Lanjutkan'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
