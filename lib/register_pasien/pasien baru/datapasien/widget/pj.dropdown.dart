import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class PjDropDown extends StatelessWidget {
  const PjDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> pjItems = [];
    return DropdownButtonFormField2(
      hint: const Text("Penggung Jawab"),
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      items: pjItems
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Tolong Di Isi Form Ini';
        }
        return null;
      },
      onChanged: (value) {},
      onSaved: (value) {},
      buttonStyleData:
          const ButtonStyleData(padding: EdgeInsets.symmetric(vertical: 16)),
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
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
