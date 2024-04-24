import 'package:flutter/material.dart';

class GridViewDoctor extends StatefulWidget {
  const GridViewDoctor({
    super.key,
  });

  @override
  State<GridViewDoctor> createState() => _GridViewDoctorState();
}

class _GridViewDoctorState extends State<GridViewDoctor> {
  final List<Map<String, dynamic>> gridMap = [
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
    {"namaDokter": "Dr.Lony, Sp.A", "Poli": "Poli Anak", "image": ""},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 300,
      ),
      itemCount: gridMap.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.blueAccent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  "${gridMap.elementAt(index)['image']}",
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
