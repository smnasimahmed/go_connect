import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widget/car_card.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/car_slider.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/home_screen/controller/home_page_controller.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CarSlider(),
                      Customtext(
                        title: ConstString.rentACarUnlockTheWorld,
                        textSize: AppSize.width(value: 16),
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      CustomElevatedButton(
                        bottom: 36,
                        buttonBorderRadius: 8,
                        height: AppSize.width(value: 36),
                        width: AppSize.width(value: 115),
                        child: Customtext(
                          title: ConstString.exploreCar,
                          textColor: Colors.white,
                          textSize: AppSize.width(value: 15),
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () => Get.toNamed(AppRoutes.carsPage),
                      ),
                    ],
                  ),
                  Customtext(
                    title: ConstString.suggestedForYou,
                    textSize: AppSize.width(value: 20),
                    fontWeight: FontWeight.w700,
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.carDetailsPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: CarCard(),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      GridView.count(
                        padding: EdgeInsets.only(top: 28, bottom: 12),
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: controller.destinationImageList.map((imagePath) {
                          return ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(4),
                            child: Image.asset(imagePath, fit: BoxFit.cover),
                          );
                        }).toList(),
                      ),
                      Customtext(
                        title: ConstString.fromTheCityStreet,
                        textSize: AppSize.width(value: 16),
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      CustomElevatedButton(
                        top: 11,
                        bottom: 36,
                        buttonBorderRadius: 8,
                        height: AppSize.width(value: 36),
                        width: AppSize.width(value: 115),
                        child: Customtext(
                          title: ConstString.searchDestination,
                          textColor: Colors.white,
                          textSize: AppSize.width(value: 15),
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
