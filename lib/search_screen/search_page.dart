import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widget/car_card.dart';
import 'package:go_connect/routes/app_routes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.shortByPage),
                    child: SvgPicture.asset(ConstIcons.filterIcon),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.filterByPage),
                    child: SvgPicture.asset(ConstIcons.sortIcon),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: CarCard(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
