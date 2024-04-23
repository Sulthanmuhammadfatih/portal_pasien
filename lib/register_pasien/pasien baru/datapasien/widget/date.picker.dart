import 'package:flutter/material.dart';

class datePicker extends StatelessWidget {
  const datePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void showdatePicker() {
      showDatePicker(
          context: context,
          firstDate: DateTime(1800),
          lastDate: DateTime(2100));
    }

    return TextField(
      decoration: InputDecoration(
        labelText: "Date",
        hintText: "Tanggal lahir",
        filled: true,
        fillColor: Colors.white,
        prefix: const Icon(Icons.calendar_today),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      readOnly: true,
      onTap: () {
        showdatePicker();
      },
    );
  }
}
