import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {
  final _box = GetStorage();
  final _key = "isDark";

  bool _loadThemeFromBox() =>
      _box.read(_key) ??
      false; //if some value exists with that key then it will return true otherwise return false
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveinbox(!_loadThemeFromBox());
  }

  _saveinbox(bool data) => _box.write(_key, data);
}
