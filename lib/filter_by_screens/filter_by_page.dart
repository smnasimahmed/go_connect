import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/custom_elevated_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/filter_by_screens/controller/filter_by_controller.dart';
import 'package:go_connect/utils/appSize.dart';

class FilterByPage extends StatelessWidget {
  const FilterByPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FilterByController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarBlankWithBackButton(ConstString.filterBy),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PriceSlider(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
                DrivingMode(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
                VehicleType(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
                Seats(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
                DistanceSlider(controller: controller),
                SizedBox(height: AppSize.width(value: 20)),
                Rating(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
                FuelType(controller: controller),
                SizedBox(height: AppSize.width(value: 20)),
                Transmission(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
                CarType(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
                ResetApplyButton(controller: controller),
                SizedBox(height: AppSize.width(value: 30)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ResetApplyButton extends StatelessWidget {
  final FilterByController controller;
  const ResetApplyButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            elevation: 0,
            right: AppSize.width(value: 9),
            height: 48,
            isoutLined: true,
            outLineColour: ConstColour.cardBorderColour,
            child: Customtext(
              title: ConstString.reset,
              textSize: AppSize.width(value: 18),
              textColor: ConstColour.textColor,
            ),
            onPressed: () => controller.resetFilter(),
          ),
        ),

        Expanded(
          child: CustomElevatedButton(
            elevation: 0,
            left: AppSize.width(value: 9),
            height: 48,

            child: Customtext(
              title: ConstString.apply,
              textSize: AppSize.width(value: 18),
              textColor: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class CarType extends StatelessWidget {
  final FilterByController controller;
  const CarType({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.carType, textSize: AppSize.width(value: 16)),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.carTypeOtions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 20),
                label: Text(option),
                selected: controller.selectedCarType == index,
                selectedColor: ConstColour.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedCarType == index
                      ? Colors.white
                      : ConstColour.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColour.cardBorderColour),
                ),
                onSelected: (_) => controller.setCarType(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Transmission extends StatelessWidget {
  final FilterByController controller;
  const Transmission({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Customtext(title: ConstString.transmission, textSize: AppSize.width(value: 16)),

          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  elevation: 0,
                  right: AppSize.width(value: 9),
                  height: 48,
                  isoutLined: !controller.manual,
                  outLineColour: ConstColour.textColor,
                  color: controller.manual ? ConstColour.textColor : Colors.white,
                  child: Customtext(
                    title: ConstString.manual,
                    textSize: AppSize.width(value: 18),
                    textColor: controller.manual ? Colors.white : ConstColour.textColor,
                  ),
                  onPressed: () => controller.setTransmissionMode(true),
                ),
              ),

              Expanded(
                child: CustomElevatedButton(
                  elevation: 0,
                  isoutLined: controller.manual,
                  outLineColour: ConstColour.textColor,
                  left: AppSize.width(value: 9),
                  height: 48,
                  color: controller.manual == false
                      ? ConstColour.textColor
                      : Colors.white,
                  child: Customtext(
                    title: ConstString.automatic,
                    textSize: AppSize.width(value: 18),
                    textColor: controller.manual == false
                        ? Colors.white
                        : ConstColour.textColor,
                  ),
                  onPressed: () => controller.setTransmissionMode(false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FuelType extends StatelessWidget {
  final FilterByController controller;
  const FuelType({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.fuelType, textSize: AppSize.width(value: 16)),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.fuelTypeOtions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 20),
                label: Text(option),
                selected: controller.selectedFuelType == index,
                selectedColor: ConstColour.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedFuelType == index
                      ? Colors.white
                      : ConstColour.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColour.cardBorderColour),
                ),
                onSelected: (_) => controller.setFuelType(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Rating extends StatelessWidget {
  final FilterByController controller;
  const Rating({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.rating, textSize: AppSize.width(value: 16)),
        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.ratingOptions.asMap().entries.map((entry) {
            final index = entry.key;
            // final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ConstIcons.starIcon,
                      colorFilter: ColorFilter.mode(
                        controller.selectedRating == index
                            ? Colors.white
                            : ConstColour.textColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text("${index + 1}"),
                  ],
                ),
                selected: controller.selectedRating == index,
                selectedColor: ConstColour.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedRating == index
                      ? Colors.white
                      : ConstColour.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColour.cardBorderColour),
                ),
                onSelected: (_) => controller.setRating(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class DistanceSlider extends StatelessWidget {
  final FilterByController controller;
  const DistanceSlider({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.priceTarget, textSize: AppSize.width(value: 16)),
        Slider(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
          activeColor: ConstColour.textColor,
          inactiveColor: ConstColour.cardBorderColour,
          min: 0.0,
          max: 10.0,
          onChanged: (value) => controller.setDistanceRange(value),
          divisions: 10,
          value: controller.selectedDistanceRange,
          label: '${controller.selectedDistanceRange.round()} km',
        ),
      ],
    );
  }
}

class Seats extends StatelessWidget {
  final FilterByController controller;
  const Seats({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.seat, textSize: AppSize.width(value: 16)),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.seatOptions.asMap().entries.map((entry) {
            final index = entry.key;
            // final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ConstIcons.vehicleTypeIcon,
                      colorFilter: ColorFilter.mode(
                        controller.selectedseatNumber == index
                            ? Colors.white
                            : ConstColour.textColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text("${index + 1}"),
                  ],
                ),
                selected: controller.selectedseatNumber == index,
                selectedColor: ConstColour.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedseatNumber == index
                      ? Colors.white
                      : ConstColour.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColour.cardBorderColour),
                ),
                onSelected: (_) => controller.setseatNumber(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class VehicleType extends StatelessWidget {
  final FilterByController controller;
  const VehicleType({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.vehicleType, textSize: AppSize.width(value: 16)),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.vehicleTypeOtions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ConstIcons.vehicleTypeIcon,
                      colorFilter: ColorFilter.mode(
                        controller.selectedVehicleType == index
                            ? Colors.white
                            : ConstColour.textColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(option),
                  ],
                ),
                selected: controller.selectedVehicleType == index,
                selectedColor: ConstColour.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedVehicleType == index
                      ? Colors.white
                      : ConstColour.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColour.cardBorderColour),
                ),
                onSelected: (_) => controller.setVehicleType(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class DrivingMode extends StatelessWidget {
  final FilterByController controller;
  const DrivingMode({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.drivingMode, textSize: AppSize.width(value: 16)),

        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                elevation: 0,
                isoutLined: !controller.withDriver,
                outLineColour: ConstColour.textColor,
                right: AppSize.width(value: 9),
                height: 48,
                color: controller.withDriver ? ConstColour.textColor : Colors.white,
                child: Customtext(
                  title: ConstString.withDriver,
                  textSize: AppSize.width(value: 18),
                  textColor: controller.withDriver ? Colors.white : ConstColour.textColor,
                ),
                onPressed: () => controller.setDrivingMode(true),
              ),
            ),

            Expanded(
              child: CustomElevatedButton(
                elevation: 0,
                left: AppSize.width(value: 9),
                height: 48,
                isoutLined: controller.withDriver,
                outLineColour: ConstColour.textColor,
                color: controller.withDriver == false
                    ? ConstColour.textColor
                    : Colors.white,
                child: Customtext(
                  title: ConstString.withOutDriver,
                  textSize: AppSize.width(value: 18),
                  textColor: controller.withDriver == false
                      ? Colors.white
                      : ConstColour.textColor,
                ),
                onPressed: () => controller.setDrivingMode(false),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PriceSlider extends StatelessWidget {
  final FilterByController controller;
  const PriceSlider({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(title: ConstString.priceTarget, textSize: AppSize.width(value: 16)),
        RangeSlider(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
          activeColor: ConstColour.textColor,
          inactiveColor: ConstColour.cardBorderColour,
          min: 0.0,
          max: 25000.0,
          values: controller.selectedPriceRange,
          onChanged: (value) => controller.setPriceRange(value),
          divisions: (25000.0 / 500).round(),
          labels: RangeLabels(
            '${controller.selectedPriceRange.start.round()} CFA',
            '${controller.selectedPriceRange.end.round()} CFA',
          ),
        ),
      ],
    );
  }
}
