import 'package:flutter/material.dart';
import 'package:portal_pasien/Custom/custom_button.dart';
import 'package:portal_pasien/dashboard/util/button.menu.dart';
import 'package:portal_pasien/dashboard/util/icons_widget.dart';
import 'package:portal_pasien/dashboard/util/nav.bottom.dart';
import 'package:portal_pasien/register_pasien/pasien%20baru/datapasien/data.pribadi.dart';
import 'package:portal_pasien/register_pasien/pasien%20lama/input.rm.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          backgroundColor: Colors.blue.shade400,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selamat Datang",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Ada Yang Bisa Kami Bantu?",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          child: ButtonMenu(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconsWidget(
                          title: "Daftar",
                          iconName: "assets/image/register.png",
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      textAlign: TextAlign.center,
                                      "Kamu tipe pasien yang mana",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    content: const Text(
                                      textAlign: TextAlign.center,
                                      "jika kamu sudah pernah berobat disini, maka pilih 'Pasien Lama'",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: CustomButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const RegisterPasienPage()));
                                                },
                                                text: "Pasien Baru"),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: CustomButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const InputRM(),
                                                    ),
                                                  );
                                                },
                                                text: "Pasien Lama"),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                        IconsWidget(
                          title: "Jadwal",
                          iconName: "assets/image/schedule.png",
                          onPressed: () {},
                        ),
                        IconsWidget(
                          title: "Peserta",
                          iconName: "assets/image/member.png",
                          onPressed: () {},
                        ),
                        IconsWidget(
                          title: "Panduann",
                          iconName: "assets/image/guidebook.png",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconsWidget(
                          title: "Fasilitas",
                          iconName: "assets/image/hospital.png",
                          onPressed: () {},
                        ),
                        IconsWidget(
                          title: "Kontak",
                          iconName: "assets/image/contact.png",
                          onPressed: () {},
                        ),
                        IconsWidget(
                          title: "Reward",
                          iconName: "assets/image/reward.png",
                          onPressed: () {},
                        ),
                        IconsWidget(
                          title: "Lainnya",
                          iconName: "assets/image/other.png",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: const NavBottom()),
    );
  }
}
