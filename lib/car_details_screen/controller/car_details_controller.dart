import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';

class CarDetailsController extends GetxController {
  bool isSelected = false;
  int currentIndex = 0;

  final List<String> buttonTitles = [
    ConstString.about,
    ConstString.photos,
    ConstString.review,
    ConstString.location,
  ];

  void setCurrentButtonIndex(int index) {
    currentIndex = index;
    update();
  }
}
