import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portal_pasien/widgets/primary_button_widget.dart';
import 'package:portal_pasien/widgets/secondary_button_widget.dart';
import 'package:portal_pasien/authentication/login/otp.page.dart';
import 'package:portal_pasien/authentication/login/sign.in.dart';
import 'package:portal_pasien/authentication/signUp/sign.up.with.email.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final FirebaseAuth auth = FirebaseAuth.instance;

    Future verifyPhoneNumber() async {
      String phoneNumber = '+62 ${phoneController.text.trim()}';
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          print('Authentikasi berhasil : ${credential.smsCode}');
        },
        verificationFailed: (FirebaseAuthException exception) {
          print('Gagal Verifikasi ${exception.message}');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Gagal Verifikasi'),
                content: const Text(
                    'Verifikasi nomer telpon gagal, silahkan coba lagi'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  )
                ],
              );
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Waktu habis dalam pengambilan code ${verificationId}');
          const Duration(seconds: 60);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          setState(
            () {
              //Kode telah di kirim
              print('Kode otp telah di kirim : ${verificationId}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnTimePassword(
                    verificationId: '',
                  ),
                ),
              );
            },
          );
        },
      );
    }

    Country country = Country(
        phoneCode: "62",
        countryCode: "ID",
        e164Sc: 0,
        geographic: true,
        level: 1,
        name: "Indonesia",
        example: "Indonesia",
        displayName: "Indonesia",
        displayNameNoCountryCode: "ID",
        e164Key: "");

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/image/vector_register.jpg",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Register",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Add your phone number, We'll send yout verification code",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: "Enter Your Number Phone",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12)),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              setState(() {
                                country = value;
                              });
                            });
                      },
                      child: Text(
                        "${country.flagEmoji} + ${country.phoneCode}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: PrimaryButtonWidget(
                onPressed: () {
                  verifyPhoneNumber();
                },
                text: "Register",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: SecondaryButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const SignUpWithEmail()));
                  },
                  text: "Register with email"),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Anda sudah memiliki akun?"), ClickableText()],
            )
          ],
        ),
      )),
    );
  }
}

class ClickableText extends StatelessWidget {
  const ClickableText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Text(
        "Login",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.blue.shade500,
        ),
      ),
    );
  }
}
