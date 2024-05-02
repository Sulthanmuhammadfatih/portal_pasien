import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownAlamat extends StatefulWidget {
  const DropDownAlamat({super.key});

  @override
  State<DropDownAlamat> createState() => _DropDownAlamatState();
}

class _DropDownAlamatState extends State<DropDownAlamat> {
  String baseUrl = "http://192.168.10.232/news_server/index.php/Api/";
  List<dynamic> _dataProv = [], _dataDisct = [], _dataSubDisct = [];
  String? _getProv, nameProv, getDisct, nameDisct, getSubDisct, nameSubDisct;
  bool disableSubDisct = false;

  void getProv() async {
    final response = await http.get(
      Uri.parse("https://dev.farizdotid.com/api/daerahindonesia/provinsi"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body)["provinsi"];
    setState(() {
      _dataProv = listData;
    });
    print("data : $listData");
  }

  void getDetailProv() async {
    final response = await http.get(
      Uri.parse(
          "https://dev.farizdotid.com/api/daerahindonesia/provinsi/$_getProv"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body);
    setState(() {
      nameProv = listData['nama'];
    });
  }

  void getDistrict() async {
    final response = await http.get(
      Uri.parse(
          "https://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=$_getProv"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body)["kota_kabupaten"];
    setState(() {
      _dataDisct = listData;
    });
    print("data : $listData");
  }

  void getDetailDistrict() async {
    final response = await http.get(
      Uri.parse(
          "https://dev.farizdotid.com/api/daerahindonesia/kota/$getDisct"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body);
    setState(() {
      nameDisct = listData['nama'];
    });
  }

  void getSubDistrict() async {
    final response = await http.get(
      Uri.parse(
          "https://dev.farizdotid.com/api/daerahindonesia/kecamatan?id_kota=$getDisct"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body);
    setState(() {
      _dataSubDisct = listData;
    });
    print("data : $listData");
  }

  void getDetailSubDistrict() async {
    final response = await http.get(
      Uri.parse(
          "https://dev.farizdotid.com/api/daerahindonesia/kecamatan/$getSubDisct"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body);
    setState(() {
      nameSubDisct = listData['nama'];
    });
  }

  @override
  void initState() {
    super.initState();
    getProv();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButtonHideUnderline(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 40),
                provinsi(),
                const SizedBox(height: 20),
                district(),
                const SizedBox(height: 20),
                _subDistrict(disableSubDisct),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _subDistrict(enableSubDist) {
    return IgnorePointer(
      ignoring: enableSubDist,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: DropdownButtonHideUnderline(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                hint: const Text("kecamatan"),
                value: getSubDisct,
                items: _dataSubDisct.map((item) {
                  return DropdownMenuItem(
                    value: item['id'].toString(),
                    child: Text(item['nama']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    getSubDisct = value.toString();
                    getDetailSubDistrict();
                  });
                },
                validator: (value) =>
                    value == null ? 'Silahkan Pilih Kecamatan' : null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget district() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButtonHideUnderline(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              hint: const Text("Choose District"),
              value: getDisct,
              items: _dataDisct.map((item) {
                return DropdownMenuItem(
                  value: item['id'].toString(),
                  child: Text(item['nama']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  disableSubDisct = false;
                  nameSubDisct = null;
                  getSubDisct = null;
                  getDisct = value.toString();
                  getDetailDistrict();
                  getSubDistrict();
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget provinsi() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButtonHideUnderline(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              hint: const Text("Pilih Provinsi"),
              value: _getProv,
              items: _dataProv.map(
                (item) {
                  return DropdownMenuItem(
                    child: Text(item['nama']),
                    value: item['id'].toString(),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(
                  () {
                    disableSubDisct = true;
                    nameDisct = null;
                    nameSubDisct = null;
                    getDisct = null;
                    getSubDisct = null;
                    _getProv = value;
                    getDetailProv();
                    getDistrict();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
