import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portal_pasien/dashboard/util/screen/page.dash.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectIndex.value,
          onDestinationSelected: (index) =>
              controller.selectIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.refresh_circle),
              label: "Recent",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.notification),
              label: "Nofitication",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.profile),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: controller.screen[controller.selectIndex.value],
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectIndex = 0.obs;

  final screen = [
    Container(
      child: const page_dash(),
    ),
    Container(color: Colors.redAccent),
    Container(color: Colors.blue),
    Container(color: Colors.blue)
  ];
}
