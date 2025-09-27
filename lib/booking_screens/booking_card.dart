import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_connect/booking_details_screen/booking_details_page.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/app_image/app_image.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Container(
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
            _BookingStatus(),
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
                  SvgPicture.asset(ConstIcons.calendarIcon),
                  Customtext(
                    left: 5,
                    title: 'Sep 25-28',
                    textSize: AppSize.width(value: 11),
                    fontWeight: FontWeight.w400,
                  ),
                  Spacer(),
                  Customtext(
                    title: '120/Total',
                    textSize: AppSize.width(value: 16),
                    textColor: ConstColour.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            _BookingInfo(),
          ],
        ),
      ),
    );
  }
}

class _BookingInfo extends StatelessWidget {
  const _BookingInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DottedLineCustom(top: 12, bottom: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Customtext(
              title: ConstString.from,
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w600,
            ),
            Customtext(
              title: ConstString.to,
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Customtext(
              title: '27 Aug, 2025 || 03:00 pm',
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w600,
            ),
            Customtext(
              title: '27 Aug, 2025 || 03:00 pm',
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Customtext(
              title: ConstString.destination,
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: [
                SvgPicture.asset(ConstIcons.locationIcon),
                Customtext(
                  left: 5,
                  title: 'California, USA',
                  textSize: AppSize.width(value: 11),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _BookingStatus extends StatelessWidget {
  const _BookingStatus();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppSize.size.width - 130,
          child: Customtext(
            title: '${ConstString.bookingId} #657198469435d4199461489416146146146494+9',
            textSize: AppSize.width(value: 16),
            textColor: const Color.fromARGB(255, 0, 90, 163),
            fontWeight: FontWeight.w500,
            maxLine: 2,
            bottom: 12,
          ),
        ),
        Spacer(),
        Customtext(
          title: 'Ongoing',
          textSize: AppSize.width(value: 16),
          textColor: Colors.orangeAccent,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
