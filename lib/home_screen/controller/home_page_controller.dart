import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final CarouselSliderController carouselController = CarouselSliderController();

  int sliderIndex = 0;

  updateSliderIndex(int index) {
    sliderIndex = index;
    update();
  }

  List sliderImageList = [
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
  ];

  List destinationImageList = [
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
  ];
}
