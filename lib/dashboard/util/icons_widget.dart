import 'package:flutter/material.dart';

class IconsWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final VoidCallback onPressed;

  const IconsWidget(
      {super.key,
      required this.title,
      required this.iconName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ))),
            onPressed: onPressed,
            child: SizedBox(
              child: Image.asset(
                iconName,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
