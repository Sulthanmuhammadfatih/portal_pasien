import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class WorkDropDownList extends StatelessWidget {
  const WorkDropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> workItem = [
      'Pegawai Negri',
      'Pegawai Swasta',
      'Pengusaha',
      'Ibu Rumah tangga',
    ];
    return DropdownButtonFormField2(
      hint: const Text("Pekerjaan"),
      isExpanded: true,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16,
        ),
      ),
      items: workItem
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Tolong Di Isi Form Ini.';
        }
        return null;
      },
      onChanged: (value) {},
      onSaved: (value) {},
      buttonStyleData:
          const ButtonStyleData(padding: EdgeInsets.only(right: 8)),
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
    );
  }
}
