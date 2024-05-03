import 'package:flutter/material.dart';
import 'package:portal_pasien/dashboard/util/nav.bottom.dart';
import 'package:portal_pasien/dashboard/util/page.dash.dart';

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
          body: const SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: PageDash(),
              ),
            ),
          ),
          bottomNavigationBar: const NavBottom()),
    );
  }
}
