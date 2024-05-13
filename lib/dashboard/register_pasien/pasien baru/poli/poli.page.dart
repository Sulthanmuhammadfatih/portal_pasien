import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// 1. Membuat Model Data
class Poli {
  final int id;
  final String name;

  Poli({required this.id, required this.name});

  factory Poli.fromJson(Map<String, dynamic> json) {
    return Poli(
      id: json['poli_id"'],
      name: json['poli_name'],
    );
  }
}

// 2. Membuat Layanan API
class ApiService {
  static Future<List<Poli>> getPoliList() async {
    final response = await http
        .get(Uri.parse('https://console.disync.id:441/multi?action=poli'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((poli_name) => Poli.fromJson(poli_name)).toList();
    } else {
      throw Exception('Failed to load poli list from API');
    }
  }
}

// 3. Membuat Widget ListView
class ListViewPoli extends StatefulWidget {
  @override
  ListViewPoliState createState() => ListViewPoliState();
}

class ListViewPoliState extends State<ListViewPoli> {
  late Future<List<Poli>> futurePoliList;

  @override
  void initState() {
    super.initState();
    futurePoliList = ApiService.getPoliList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poli List'),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<List<Poli>>(
              future: futurePoliList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Poli> poliList = snapshot.data!;
                  return ListView.builder(
                    itemCount: poliList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(poliList[index].name),
                        // You can add more data display as needed
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
