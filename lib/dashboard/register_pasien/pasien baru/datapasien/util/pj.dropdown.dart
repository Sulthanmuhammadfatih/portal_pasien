import 'package:flutter/material.dart';

class PjDropDown extends StatefulWidget {
  const PjDropDown({Key? key}) : super(key: key);

  @override
  _PjDropDownState createState() => _PjDropDownState();
}

class _PjDropDownState extends State<PjDropDown> {
  String? _selectedPj;
  List<String> pjItems = [
    'Pj 1',
    'Pj 2',
    'Pj 3'
  ]; // Contoh daftar penanggung jawab

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: const Text(
        "Penggung Jawab",
        style: TextStyle(color: Colors.black54),
      ),
      value: _selectedPj,
      onChanged: (newValue) {
        setState(() {
          _selectedPj = newValue;
        });
      },
      items: pjItems
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black45),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black45),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const  BorderSide(color: Colors.black45),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Tolong Di Isi Form Ini';
        }
        return null;
      },
      onSaved: (value) {},
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
    );
  }
}
