import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_connect/booking_screens/booking_page.dart';
import 'package:go_connect/chat_screen/chat_page.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/home_screen/home_page.dart';
import 'package:go_connect/search_screen/search_page.dart';

class NavbarController extends GetxController {
  final role = GetStorage();

  // List<String> iconLabel = [
  //   ConstString.homeMenuItem,
  //   ConstString.blogMenuItem,
  //   ConstString.audioMenuItem,
  //   ConstString.shopMenuItem,
  //   ConstString.specialistsMenuItem,
  // ];
  List<String> icons = [
    ConstIcons.homeTabIcon,
    ConstIcons.searchTabIcon,
    ConstIcons.chatTabIcon,
    ConstIcons.bookmarksTabIcon,
  ];

  List<Widget> pages = [HomePage(), SearchPage(), ChatPage(), BookingPage()];

  RxInt selectedIndex = 0.obs;
}
