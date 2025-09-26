import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/app_image/app_image.dart';
import 'package:go_connect/custom_widget/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/cancle_pop_up.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBlankWithBackButton('${ConstString.booking} ${ConstString.details}'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
          child: Column(
            children: [
              BookingStatus(),
              CarInfo(),
              BookingInfo(),
              Map(),
              HostInfo(),
              DriverDetails(),
              TransectionDetails(),
              BottomButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return false ? CheckOut() : CheckIN();
  }
}

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              Customtext(
                title: '${ConstString.checkIn} ${ConstString.details}',
                textSize: AppSize.width(value: 16),
                fontWeight: FontWeight.w500,
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
        ),
        CustomElevatedButton(
          top: 0,
          bottom: 20,
          height: 56,
          elevation: 0,
          onPressed: () {},
          color: ConstColour.primaryColor,

          child: Customtext(
            title: ConstString.checkOut,
            fontWeight: FontWeight.w400,
            textColor: Colors.white,
            textSize: AppSize.width(value: 18),
          ),
        ),
      ],
    );
  }
}

class CheckIN extends StatelessWidget {
  const CheckIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          top: 0,
          height: 56,
          elevation: 0,
          onPressed: () {},
          color: ConstColour.primaryColor,

          child: Customtext(
            title: ConstString.checkIn,
            fontWeight: FontWeight.w400,
            textColor: Colors.white,
            textSize: AppSize.width(value: 18),
          ),
        ),

        CustomElevatedButton(
          top: 0,
          bottom: 10,
          height: 56,
          elevation: 0,
          onPressed: () => canclePopUp(context),
          color: Colors.transparent,
          child: Customtext(
            title: ConstString.cancle,
            fontWeight: FontWeight.w400,
            textColor: Colors.red,
            textSize: AppSize.width(value: 18),
          ),
        ),
      ],
    );
  }
}

class TransectionDetails extends StatelessWidget {
  const TransectionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(
          title: '${ConstString.transaction} ${ConstString.details}',
          textSize: AppSize.width(value: 18),
          fontWeight: FontWeight.w500,
          bottom: 3,
          top: 20,
        ),
        DetailsItem(headers: ConstString.status, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.totalAmount, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.paymentMethod, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.date, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.transactionId, info: 'Amsterdam, Netherlands'),
      ],
    );
  }
}

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(
          title: ConstString.details,
          textSize: AppSize.width(value: 18),
          fontWeight: FontWeight.w500,
          bottom: 3,
          top: 20,
        ),
        DetailsItem(headers: ConstString.fullName, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.phoneNumber, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.email, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.licenseNumber, info: 'Amsterdam, Netherlands'),
      ],
    );
  }
}

class DetailsItem extends StatelessWidget {
  final String headers;
  final String info;
  const DetailsItem({super.key, required this.headers, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.width(value: 115),
            child: Customtext(
              title: headers,
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w400,
              textColor: ConstColour.cardBorderColour,
              textAlign: TextAlign.start,
            ),
          ),
          Customtext(
            title: info,
            textSize: AppSize.width(value: 12),
            fontWeight: FontWeight.w500,
            maxLine: 20,
          ),
        ],
      ),
    );
  }
}

class HostInfo extends StatelessWidget {
  const HostInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Customtext(
          top: 11,
          bottom: 12,
          title: ConstString.hostedBy,
          textSize: AppSize.width(value: 18),
          fontWeight: FontWeight.w700,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageCircular(width: 48, height: 48),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customtext(
                  left: 6,
                  title: 'Samuel',
                  textSize: AppSize.width(value: 16),
                  fontWeight: FontWeight.w700,
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
            Spacer(),
            CustomElevatedButton(
              top: 0,
              elevation: 0,
              height: 32,
              width: 0,
              color: ConstColour.textColor,
              onPressed: () {},
              child: Customtext(
                title: ConstString.message,
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
                textSize: AppSize.width(value: 10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Container(
        width: double.infinity,
        // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 6),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: ConstColour.cardBorderColour),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Customtext(
              textSize: 20,
              fontWeight: FontWeight.w600,
              title: ConstString.location, //AppString.location,
            ),
            SizedBox(height: AppSize.width(value: 10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customtext(
                  title: "12b, Lekki Phase 1, Lagos, Nigeria",
                  textSize: 14,
                  fontWeight: FontWeight.w500,
                  // controller.singleBookingById?.parentId.address ??
                  // 'N/A', //"12b, Lekki Phase 1, Lagos, Nigeria",
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstColour.textColor,
                  ),
                  child: Customtext(
                    textSize: 12,
                    fontWeight: FontWeight.w400,
                    title:
                        '2.2 km away', //controller.distance.toString(), //"2.3 km away",
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.width(value: 6)),

            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Container(
                height: 200,
                width: double.infinity,
                // margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/car.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),

                //  Obx(
                //   () => GoogleMap(
                //     onMapCreated: controller.onMapCreated,
                //     initialCameraPosition: CameraPosition(
                //       target: controller.currentPosition.value,
                //       zoom: 15,
                //     ),
                //     markers: controller.markers.toSet(),
                //     zoomControlsEnabled: true,
                //     mapToolbarEnabled: false,
                //     myLocationButtonEnabled: false,
                //     myLocationEnabled: true,
                //     mapType: MapType.normal,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingInfo extends StatelessWidget {
  const BookingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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

class CarInfo extends StatelessWidget {
  const CarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              SvgPicture.asset(ConstIcons.calendarIcon),
              Customtext(
                left: 5,
                title: 'Sep 25-28',
                textSize: AppSize.width(value: 11),
                fontWeight: FontWeight.w400,
              ),
              Spacer(),
              Customtext(
                title: '\$ 120/Total',
                textSize: AppSize.width(value: 15),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BookingStatus extends StatelessWidget {
  const BookingStatus({super.key});

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
