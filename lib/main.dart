
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/splash_screen.dart';
import 'views/dashboard_screen.dart';
import 'views/campaign_screen.dart';
import 'views/myinfo_screen.dart';
import 'controllers/campaign_controller.dart';

void main() {
  Get.put(CampaignController());
  runApp(MyFlynApp());
}

class MyFlynApp extends StatelessWidget {
  const MyFlynApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MY FLYN',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/campaign', page: () => CampaignScreen()),
        GetPage(name: '/myinfo', page: () => MyInfoScreen()),
      ],
    );
  }
}
