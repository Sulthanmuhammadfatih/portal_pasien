import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CountryDropDownList extends StatelessWidget {
  const CountryDropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> countryItem = ['WNI', 'WNA'];
    // String selectedOption = '0';

    return DropdownButtonFormField2(
      hint: const Text("Kewarganegaraan"),
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      items: countryItem
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Tolong Di Isi Form Ini';
        }
        return null;
      },
      onChanged: (value) {
        // selectedOption = value.toString();
      },
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}