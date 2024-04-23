import 'package:flutter/material.dart';

class ResultRegister extends StatefulWidget {
  const ResultRegister({Key? key}) : super(key: key);

  @override
  State<ResultRegister> createState() => _ResultRegisterState();
}

class _ResultRegisterState extends State<ResultRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
