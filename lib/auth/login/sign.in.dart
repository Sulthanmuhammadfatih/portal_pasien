import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portal_pasien/Custom/custom_outline.dart';
import 'package:portal_pasien/dashboard/dashboard.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/Custom/edit_text.dart';
import 'package:portal_pasien/auth/login/sign.in.with.number.dart';
import 'package:portal_pasien/auth/signUp/sign.up.number.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // ignore: unused_local_variable
      User? user = userCredential.user;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashboardPage()));
    } catch (e) {
      print("Gagal masuk:$e");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Gagal Masuk"),
              content: const Text(
                  "email atau kata sandi anda salah, silahkan coba lagi. "),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset("assets/image/vectorlogin.jpg"),
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black38),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EditText(
                    controller: emailController,
                    text: "Email",
                    textInputType: TextInputType.emailAddress,
                    obsecure: false,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Mohon di isi email anda';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditText(
                    controller: passwordController,
                    text: "Password",
                    textInputType: TextInputType.visiblePassword,
                    obsecure: true,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Mohon di isi email anda';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomButton(onPressed: _signIn, text: "Sign In"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomOutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginWithNumber()));
                      },
                      text: "Sign In With Number",
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account?",
                        textAlign: TextAlign.center,
                      ),
                      ClickableText()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistrationPage()));
      },
      child: Text(
        "Register",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.blue.shade500,
        ),
      ),
    );
  }
}
