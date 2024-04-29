import 'package:flutter/material.dart';
import 'package:portal_pasien/dashboard/dashboard.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/county.dropdown.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/date.picker.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/dropdown.list.address.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/gender.dropdown.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/maritall.dropdown.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/pj.dropdown.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/religion.dropdown.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/work.dropdown.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/type.payment.dart';
import 'package:portal_pasien/Custom/custom.outline.button.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/Custom/edit_text.dart';

final formKey_ = GlobalKey<FormState>();

class RegisterPasienPage extends StatefulWidget {
  const RegisterPasienPage({super.key});

  @override
  State<RegisterPasienPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPasienPage> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController tempatlahir = TextEditingController();
  final TextEditingController nomerHandphonne = TextEditingController();
  final TextEditingController alamat = TextEditingController();
  final GlobalKey<FormState> formkey_ = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                                  builder: (context) => const DashboardPage()));
                        },
                      ),
                    ),
                    const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text("1/5"),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white60),
                  child: Form(
                    key: formkey_,
                    child: Column(
                      children: [
                        EditText(
                            controller: nama,
                            text: 'Nama',
                            textInputType: TextInputType.name,
                            obscure: false,
                            validator: (nama) {
                              if (nama == null || nama.isEmpty) {
                                return 'please enter your name';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        const GenderDropDown(),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                            controller: tempatlahir,
                            text: 'Tempat Lahir',
                            textInputType: TextInputType.name,
                            obscure: false,
                            validator: (tempatlahir) {
                              if (tempatlahir == null || tempatlahir.isEmpty) {
                                return 'please enter your place of birth';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        const datePicker(),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                            controller: nomerHandphonne,
                            text: 'Nomer Handphone',
                            textInputType: TextInputType.number,
                            obscure: false,
                            validator: (nomerHandphonne) {
                              if (nomerHandphonne == null ||
                                  nomerHandphonne.isEmpty) {
                                return 'Tolong Di Isi Form Ini';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        const ReligionDropDown(),
                        const SizedBox(
                          height: 25,
                        ),
                        const WorkDropDownList(),
                        const SizedBox(
                          height: 25,
                        ),
                        const PjDropDown(),
                        const SizedBox(
                          height: 25,
                        ),
                        const MaritallStatusDropDown(),
                        const SizedBox(
                          height: 25,
                        ),
                        const CountryDropDownList(),
                        const SizedBox(
                          height: 25,
                        ),
                        DropDownAlamat(),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                            controller: alamat,
                            text: 'alamat',
                            textInputType: TextInputType.name,
                            validator: (alamat) {
                              if (alamat == null || alamat.isEmpty) {
                                return 'Tolong Di isi Form Ini';
                              }
                              return null;
                            },
                            obscure: false),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CustomButton(
                                onPressed: () {
                                  if (formkey_.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PaymentType()));
                                  }
                                },
                                text: 'Lanjutkan'))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
