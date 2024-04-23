import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownAlamat extends StatefulWidget {
  DropDownAlamat({Key? key}) : super(key: key);

  @override
  State<DropDownAlamat> createState() => _DropDownAlamatState();
}

class _DropDownAlamatState extends State<DropDownAlamat> {
  String baseUrl = "http://192.168.10.232/news_server/index.php/Api/";
  List<dynamic> _dataProv = [], _dataDisct = [], _dataSubDisct = [];
  String? _getProv,
      _nameProv,
      _getDisct,
      _nameDisct,
      _getSubDisct,
      _nameSubDisct;
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
      _nameProv = listData['nama'];
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
          "https://dev.farizdotid.com/api/daerahindonesia/kota/$_getDisct"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body);
    setState(() {
      _nameDisct = listData['nama'];
    });
  }

  void getSubDistrict() async {
    final response = await http.get(
      Uri.parse(
          "https://dev.farizdotid.com/api/daerahindonesia/kecamatan?id_kota=$_getDisct"),
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
          "https://dev.farizdotid.com/api/daerahindonesia/kecamatan/$_getSubDisct"),
      headers: {"Accept": "application/json"},
    );
    var listData = jsonDecode(response.body);
    setState(() {
      _nameSubDisct = listData['nama'];
    });
  }

  @override
  void initState() {
    super.initState();
    getProv();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_nameProv ?? ""),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_nameDisct ?? ""),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_nameSubDisct ?? ""),
                  ),
                ],
              ),
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
                value: _getSubDisct,
                items: _dataSubDisct.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['nama']),
                    value: item['id'].toString(),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _getSubDisct = value.toString();
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
              value: _getDisct,
              items: _dataDisct.map((item) {
                return DropdownMenuItem(
                  child: Text(item['nama']),
                  value: item['id'].toString(),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  disableSubDisct = false;
                  _nameSubDisct = value.toString();
                  _getSubDisct = value.toString();
                  _getDisct = value.toString();
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
                    _nameDisct = value.toString();
                    _nameSubDisct = value.toString();
                    _getDisct = value.toString();
                    _getSubDisct = value.toString();
                    _getProv = value.toString();
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
