import 'package:flutter/material.dart';
import 'package:qrcode_app/generate_qr.dart';
import 'package:qrcode_app/scan_qr.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: const TabBarView(children: [ScanQr(), GenerateQr()]),
          bottomNavigationBar: Container(
            height: 70,
            child: Container(
              color: Colors.black87,
              child: const TabBar(
                  indicatorColor: Colors.white,
                  splashBorderRadius: BorderRadius.all(Radius.circular(15)),
                  dividerColor: Colors.grey,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      child: Text(
                        'Scan Qr',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Generate Qr',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
