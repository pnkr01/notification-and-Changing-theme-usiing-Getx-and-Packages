import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/services/notification_services.dart';
import 'package:todoapp/services/theme_service.dart';

var notifyHelper;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Change The Theme",
              style: TextStyle(
                fontSize: 21.0,
              ),
            ),
            
          ),  
        ],
      ),
    );
  }
}

_appBar() {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        ThemeServices().switchTheme();
        notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Light Theme Has Been Activated "
                : "Dark Theme Has Been Activated ");

        notifyHelper.scheduledNotification();
      },
      child: Icon(
        Icons.nightlight_round,
        size: 20.0,
      ),
    ),
    actions: [
      Icon(
        Icons.person,
        size: 20.0,
      ),
      SizedBox(
        width: 20.0,
      ),
    ],
  );
}
