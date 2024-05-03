import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/Custom/edit_text.dart';

class OnTimePassword extends StatefulWidget {
  final String verificationId;

  const OnTimePassword({super.key, required this.verificationId});

  @override
  State<OnTimePassword> createState() => _OnTimePasswordState();
}

class _OnTimePasswordState extends State<OnTimePassword> {
  TextEditingController otpSignIp = TextEditingController();
  Future<void> signInWithNumberPhone(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      print('Autentikasi berhasil');
    } catch (e) {
      print('Autentikasi gagal: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset(
                    "assets/image/otp.jpg",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "We'll send you verification code, after send your number phone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                EditText(
                  controller: otpSignIp,
                  text: "OTP",
                  textInputType: TextInputType.number,
                  obscure: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButton(
                      onPressed: () {
                        String smsCode = otpSignIp.text.trim();
                        signInWithNumberPhone(smsCode);
                      },
                      text: "Continue"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
