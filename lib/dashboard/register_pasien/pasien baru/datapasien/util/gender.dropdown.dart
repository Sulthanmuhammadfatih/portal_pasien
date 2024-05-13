import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class GenderDropDown extends StatelessWidget {
  const GenderDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> genderItem = ['Pria', 'Wanita'];

    return DropdownButtonFormField2<String>(
      hint: const Text("Jenis Kelamin"),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      isExpanded: true,
      items: genderItem
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          )
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
          iconSize: 24),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      ),
      menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16)),
    );
  }
}