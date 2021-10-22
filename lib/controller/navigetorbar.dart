import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
class Navigetorbar extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems => [
        "ຫນ້າຫລັກ",
        "ກ່ຽວກັບ",
        "ບໍລິການ",
        "ຜົນງານ",
        "ທີມງານ",
        "ນັດມື້ເຂົ້າພົບ",
        "ຕິດຕໍ່"
      ];
  List<Icon> get menuIcon => [
        Icon(Icons.home, color: Colors.black),
        Icon(Icons.add_box, color: Colors.black),
        Icon(Icons.phone, color: Colors.black),
        Icon(Icons.downhill_skiing_outlined, color: Colors.black),
        Icon(Icons.link, color: Colors.black),
        Icon(Icons.contact_phone, color: Colors.black),
        Icon(Icons.meeting_room, color: Colors.black),
      ];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;
  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openEndDrawer();
    } else {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
}
