import 'package:flutter/material.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/Custom/custom_outline.dart';
import 'package:portal_pasien/Custom/edit_text.dart';
import 'package:portal_pasien/auth/login/sign.in.dart';
import 'package:portal_pasien/auth/signUp/sign.up.number.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final TextEditingController namaPertama = TextEditingController();
  final TextEditingController namaTerakhir = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Image.asset(
                  "assets/image/mobile.jpg",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Register",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Silahkan di isi untuk mendaftar aplikasi",
                style: TextStyle(fontSize: 17, color: Colors.black26),
              ),
              const SizedBox(
                height: 40,
              ),
              EditText(
                controller: namaPertama,
                text: "Nama Pertama",
                textInputType: TextInputType.name,
                obscure: false,
              ),
              const SizedBox(
                height: 15,
              ),
              EditText(
                controller: namaTerakhir,
                text: "Nama Terakhir",
                textInputType: TextInputType.name,
                obscure: false,
              ),
              const SizedBox(
                height: 15,
              ),
              EditText(
                controller: email,
                text: "Email",
                textInputType: TextInputType.emailAddress,
                obscure: false,
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return "Tolong di isi form ini";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              EditText(
                controller: password,
                text: "Password",
                textInputType: TextInputType.visiblePassword,
                obscure: true,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return "Tolong di isi form ini";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {},
                  text: "Register",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomOutlineButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    text: "Sign Up With Number"),
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Anda sudah memiliki akun?"), ClickableText()],
              )
            ],
          ),
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
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
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
