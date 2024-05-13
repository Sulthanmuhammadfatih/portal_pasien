import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ReligionDropDown extends StatelessWidget {
  const ReligionDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> religionItem = [
      'Islam',
      'kristen',
      'Hindu',
      'Buddha',
      'Khonghucu',
      'Katolik'
    ];

    return DropdownButtonFormField2<String>(
      hint: const Text("Agama"),
      isExpanded: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black12),
        ),
      ),
      items: religionItem
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Tolong Di isi Form Ini.';
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
