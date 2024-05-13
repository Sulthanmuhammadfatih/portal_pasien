import 'package:flutter/material.dart';

import '../Custom/custom_button.dart';
import 'widget/pasien baru/datapasien/data.pribadi.dart';
import 'widget/pasien lama/input.rm.dart';
import '../Custom/icons_widget.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blueAccent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.schedule),
            ),
            label: 'Recent',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
              icon: Badge(
                child: Icon(Icons.verified_user),
              ),
              label: 'Profile'),
        ],
      ),
      body: <Widget>[
        ///Dashbboard
        Card(
          color: Colors.blueAccent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),
      ][currentPageIndex],
    );
  }
}
