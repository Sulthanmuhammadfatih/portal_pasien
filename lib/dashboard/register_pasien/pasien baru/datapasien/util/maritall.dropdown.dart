import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MaritallStatusDropDown extends StatelessWidget {
  const MaritallStatusDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> maritalStatus = [
      'Belum Menikah',
      'Menikah',
      'Duda',
      'Janda'
    ];

    return DropdownButtonFormField2(
      hint: const Text("Status Pernikahan"),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      isExpanded: true,
      items: maritalStatus
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Tolong Di Isi Form ini.';
        }
        return null;
      },
      onChanged: (value) {},
      onSaved: (newValue) {
      },
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
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16)),
    );
  }
}
