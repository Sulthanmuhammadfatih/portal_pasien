import 'package:flutter/material.dart';
import 'package:portal_pasien/dashboard/dashboard.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/date.picker.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/widget/dropdown.list.kecamatan.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/type.payment.dart';
import 'package:portal_pasien/Custom/custom.outline.button.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/Custom/edit_text.dart';

final formKey_ = GlobalKey<FormState>();

class RegisterPasienPage extends StatefulWidget {
  const RegisterPasienPage({Key? key}) : super(key: key);

  @override
  State<RegisterPasienPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPasienPage> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController jenisKelamin = TextEditingController();
  final TextEditingController tempatlahir = TextEditingController();
  final TextEditingController nomerHandphonne = TextEditingController();
  final TextEditingController agama = TextEditingController();
  final TextEditingController pekerjaan = TextEditingController();
  final TextEditingController penanggungJawab = TextEditingController();
  final TextEditingController statusPernikahan = TextEditingController();
  final TextEditingController negara = TextEditingController();
  final TextEditingController provinsi = TextEditingController();
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
                        EditText(
                            controller: jenisKelamin,
                            text: 'Jenis Kelamin',
                            textInputType: TextInputType.name,
                            obscure: false,
                            validator: (jenisKelamin) {
                              if (jenisKelamin == null ||
                                  jenisKelamin.isEmpty) {
                                return 'please enter your gender';
                              }
                              return null;
                            }),
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
                                return 'please enter your number phone';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                            controller: agama,
                            text: 'Agama',
                            textInputType: TextInputType.name,
                            obscure: false,
                            validator: (agama) {
                              if (agama == null || agama.isEmpty) {
                                return 'please enter your region';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                            controller: pekerjaan,
                            text: 'Pekerjaan',
                            textInputType: TextInputType.name,
                            obscure: false,
                            validator: (pekerjaan) {
                              if (pekerjaan == null || pekerjaan.isEmpty) {
                                return 'please enter your work';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                            controller: penanggungJawab,
                            text: 'Penanggung Jawab',
                            textInputType: TextInputType.name,
                            obscure: false,
                            validator: (penanggungJawab) {
                              if (penanggungJawab == null ||
                                  penanggungJawab.isEmpty) {
                                return 'Mohon di isi untuk form Penanggung jawab';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                            controller: statusPernikahan,
                            text: 'Status Pernikahan',
                            textInputType: TextInputType.name,
                            obscure: false,
                            validator: (statusPernikahan) {
                              if (statusPernikahan == null ||
                                  statusPernikahan.isEmpty) {
                                return 'Mohon di isi untuk form Status pernikahan';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        EditText(
                          controller: negara,
                          text: 'Kewarganegaraan',
                          textInputType: TextInputType.name,
                          obscure: false,
                          validator: (negara) {
                            if (negara == null || negara.isEmpty) {
                              return 'Mohon di isi form kewarganegaraan';
                            }
                            return null;
                          },
                        ),
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
                                return 'Mohon di isi form alamat';
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
