import 'package:flutter/material.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultPage extends StatelessWidget {
  final String nama;
  final String jeniskelamin;
  final String tempatLahir;
  final String tanggalLahir;
  final String nomerHandphone;
  final String agama;
  final String pekerjaan;
  final String penanggungjawab;
  final String statusPernikahan;
  final String provinsi;
  final String alamat;

  ResultPage(
      {super.key,
      required this.nama,
      required this.jeniskelamin,
      required this.tempatLahir,
      required this.tanggalLahir,
      required this.nomerHandphone,
      required this.agama,
      required this.pekerjaan,
      required this.penanggungjawab,
      required this.statusPernikahan,
      required this.provinsi,
      required this.alamat});

  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('');

  Future<void> addDataToFirebase() {
    return dataCollection.add({
      'nama': nama,
      'jeniskelamin': jeniskelamin,
      'tempatlahir': tempatLahir,
      'tanggallahir': tanggalLahir,
      'nomerhandphone': nomerHandphone,
      'penanggungjawab': penanggungjawab,
      'statuspernikahan': statusPernikahan,
      'provinsi': provinsi,
      'alamat': alamat
    }).then((value) => print('Data berhasil Di Kirim'))
    .catchError((error) => print("Gagal Menambahkan Data : $Error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'nama: $nama',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'jenis kelamin : $jeniskelamin',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'tempat lahir : $tempatLahir',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'tanggal lahir : $tanggalLahir',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'nomer telfon : $nomerHandphone',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'agama : $agama',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'pekerjaan : $pekerjaan',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'tanggung jawab : $penanggungjawab',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'status pernikahan : $statusPernikahan',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'provinsi : $provinsi',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'alamat : $alamat',
                    style: const TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {},
                  text: 'submit',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
