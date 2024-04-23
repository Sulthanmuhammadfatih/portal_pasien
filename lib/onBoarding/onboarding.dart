import 'package:flutter/material.dart';
import 'package:portal_pasien/auth/login/sign.in.dart';
import 'package:portal_pasien/Custom/custom_button.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: Image.asset(
                  "assets/image/mobile.jpg",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Start Your Easy Way To Appointment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Your easiest to Make a Appointment to hospital, or Doctor even You can buy medicine on this app, Grab now!",
                style: TextStyle(color: Colors.black38, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  text: "Get Started",
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
