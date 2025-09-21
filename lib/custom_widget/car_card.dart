import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widget/app_image/app_image.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ConstColour.cardBorderColour),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(6),
            child: AppImage(
              path: 'assets/images/car.png',
              height: AppSize.width(value: 170),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Customtext(
            title: 'Revuelto (a V12 hybrid supercar)',
            textSize: AppSize.width(value: 21),
            fontWeight: FontWeight.w600,
          ),
          Row(
            children: [
              Customtext(
                title: '5.0 ⭐ ',
                textSize: AppSize.width(value: 13),
                fontWeight: FontWeight.w400,
              ),
              Customtext(
                title: '(15 Trips) ',
                textSize: AppSize.width(value: 13),
                fontWeight: FontWeight.w400,
              ),
              SvgPicture.asset(ConstIcons.carsIcon),
              Customtext(
                title: ' With Driver',
                textSize: AppSize.width(value: 13),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              children: [
                SvgPicture.asset(ConstIcons.locationIcon),
                Customtext(
                  left: 5,
                  title: 'Santa Ana',
                  textSize: AppSize.width(value: 11),
                  fontWeight: FontWeight.w400,
                ),
                Customtext(
                  title: ' • ',
                  textSize: AppSize.width(value: 11),
                  fontWeight: FontWeight.w400,
                ),
                Customtext(
                  title: '32.5 miles',
                  textSize: AppSize.width(value: 11),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Row(
              children: [
                SvgPicture.asset(ConstIcons.greenDotIcon),
                Customtext(
                  left: 5,
                  title: 'Available',
                  textSize: AppSize.width(value: 11),
                  fontWeight: FontWeight.w400,
                ),
                Spacer(),
                Customtext(
                  title: '25000F CFA/Day',
                  textSize: AppSize.width(value: 15),
                  textColor: ConstColour.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
