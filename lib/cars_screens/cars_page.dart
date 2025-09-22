import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/car_card.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBlankWithBackButton(ConstString.cars),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => InkWell(
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
