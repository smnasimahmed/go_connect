import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_connect/car_details_screen/controller/car_details_controller.dart';
import 'package:go_connect/car_review_screen/review_screen.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/app_image/app_image.dart';
import 'package:go_connect/custom_widget/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBlankWithBackButton(ConstString.carsDetails),
      body: SingleChildScrollView(
        child: GetBuilder(
          init: CarDetailsController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarImage(),
                  CarLocationAndName(),
                  Buttons(controller: controller),

                  // About(controller: controller),
                  // Photos(),
                  // ReviewScreen(),
                  // Map(controller: controller),
                  switch (controller.currentIndex) {
                    0 => About(controller: controller),
                    1 => Photos(),
                    2 => ReviewScreen(),
                    3 => Map(controller: controller),
                    _ => const Text("Default widget"),
                  },

                  HostInfo(controller: controller),
                  SizedBox(height: AppSize.height(value: 12)),
                  PriceAndbookNowButton(),
                  SizedBox(height: AppSize.height(value: 26)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Map extends StatelessWidget {
  final CarDetailsController controller;
  const Map({super.key, required this.controller});

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

class Photos extends StatelessWidget {
  const Photos({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .9,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 1.47,
        ),

        itemCount: 6,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AppImage(
            path: 'assets/images/car.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

class PriceAndbookNowButton extends StatelessWidget {
  const PriceAndbookNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Customtext(
              title: ConstString.price,
              textSize: AppSize.width(value: 18),
              fontWeight: FontWeight.w700,
            ),
            Customtext(
              title: '25000F CFA/Day',
              textSize: AppSize.width(value: 14),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomElevatedButton(
            top: 0,
            height: 56,
            elevation: 0,
            onPressed: () {},
            child: Customtext(
              title: ConstString.bookNow,
              fontWeight: FontWeight.w400,
              textColor: Colors.white,
              textSize: AppSize.width(value: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class HostInfo extends StatelessWidget {
  final CarDetailsController controller;
  const HostInfo({super.key, required this.controller});

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
                Customtext(
                  left: 6,
                  title: 'Owner',
                  textSize: AppSize.width(value: 14),
                  fontWeight: FontWeight.w400,
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
                title: ConstString.viewDetails,
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

class About extends StatelessWidget {
  final CarDetailsController controller;
  const About({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(
          title:
              'Rent this spacious mid-size SUV in Amsterdam, ideal for both city driving and road trips.It offers plenty of room for passengers and luggage, making it perfect for families or groups. The car features modern amenities, including air conditioning, GPS navigation, and Bluetooth connectivity, ensuring a comfortable and hassle-free ride.',
          textSize: AppSize.width(value: 14),
          fontWeight: FontWeight.w400,
          maxLine: 100,
          top: 10,
          bottom: 17,
        ),
        Customtext(
          title: '${ConstString.features}:',
          textSize: AppSize.width(value: 22),
          fontWeight: FontWeight.w500,
          bottom: 3,
        ),
        FeaturesItem(headers: ConstString.location, info: 'Amsterdam, Netherlands'),
        FeaturesItem(headers: ConstString.carType, info: 'Amsterdam, Netherlands'),
        FeaturesItem(headers: ConstString.seats, info: 'Amsterdam, Netherlands'),
        FeaturesItem(headers: ConstString.transmission, info: 'Amsterdam, Netherlands'),
        FeaturesItem(headers: ConstString.fuelType, info: 'Amsterdam, Netherlands'),
        FeaturesItem(
          headers: ConstString.airConditioning,
          info: 'Amsterdam, Netherlands',
        ),
        FeaturesItem(headers: ConstString.gpsNavigation, info: 'Amsterdam, Netherlands'),
        FeaturesItem(headers: ConstString.mileage, info: 'Amsterdam, Netherlands'),
        FeaturesItem(headers: ConstString.bluetooth, info: 'Amsterdam, Netherlands'),
        FeaturesItem(
          headers: ConstString.description,
          info:
              'This compact sedan is perfect for exploring Amsterdam and its surroundings. Featuring a fuel-efficient engine, comfortable seating for up to 4 people, and modern amenities like GPS and Bluetooth, it’s the ideal choice for travelers looking for convenience and comfort. Enjoy a flexible rental period with unlimited mileage, and the peace of mind with included insurance. Pickup and drop-off at a central location for ease.',
        ),
      ],
    );
  }
}

class FeaturesItem extends StatelessWidget {
  final String headers;
  final String info;
  const FeaturesItem({super.key, required this.headers, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.width(value: 115),
            child: Customtext(
              title: headers,
              textSize: AppSize.width(value: 14),
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(child: Customtext(title: info, maxLine: 20)),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final CarDetailsController controller;
  const Buttons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controller.buttonTitles.length, (index) {
        return CustomElevatedButton(
          elevation: 0,
          color: controller.currentIndex == index ? ConstColour.textColor : Colors.white,
          height: 32,
          width: 0,
          horizontal: AppSize.width(value: 16),
          onPressed: () {
            // Handle button actions by index
            switch (index) {
              case 0:
                // Navigate to About page
                controller.setCurrentButtonIndex(index);
                break;
              case 1:
                // Navigate to Features page
                controller.setCurrentButtonIndex(index);
                break;
              case 2:
                // Navigate to Reviews page
                controller.setCurrentButtonIndex(index);
                break;
              case 3:
                // Navigate to Similar page
                controller.setCurrentButtonIndex(index);
                break;
            }
          },
          child: Customtext(
            title: controller.buttonTitles[index],
            textSize: AppSize.width(value: 14),
            fontWeight: FontWeight.w600,
            textColor: controller.currentIndex == index
                ? Colors.white
                : ConstColour.textColor,
          ),
        );
      }),
    );
  }
}

class CarLocationAndName extends StatelessWidget {
  const CarLocationAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              SvgPicture.asset(ConstIcons.locationIcon, width: 15),
              SizedBox(width: 4),
              Customtext(
                textSize: AppSize.width(value: 16),
                fontWeight: FontWeight.w400,
                textColor: ConstColour.textColor,
                title: "Dugbe, Ibadan",
              ),
            ],
          ),
        ),
        Customtext(
          textSize: AppSize.width(value: 20),
          fontWeight: FontWeight.w600,
          textColor: ConstColour.textColor,
          title: "Revuelto (a V12 hybrid supercar)",
        ),
      ],
    );
  }
}

class CarImage extends StatelessWidget {
  const CarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 3),
                blurRadius: 3,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: AppImage(
              path: 'assets/images/car.png',
              height: 234,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          top: 9,
          right: 5,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSize.width(value: 32),
                width: AppSize.width(value: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.share_outlined, size: 20),
              ),
              SizedBox(width: AppSize.width(value: 8)),
              Container(
                height: AppSize.width(value: 32),
                width: AppSize.width(value: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  // ignore: dead_code
                  true ? Icons.favorite_rounded : Icons.favorite_outline_outlined,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
