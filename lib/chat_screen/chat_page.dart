import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/chat_screen/controller/chat_page_controller.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widget/custom_formField.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChatPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            toolbarHeight: 110,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Customtext(
                    title: ConstString.airConditioning,
                    textSize: AppSize.width(value: 26),
                    fontWeight: FontWeight.w700,
                  ),
                  CustomTextFormField(
                    fromTitle: '',
                    hintText: Customtext(
                      title: ConstString.searchHere,
                      textSize: AppSize.width(value: 16),
                      textColor: ConstColour.cardBorderColour,
                      fontWeight: FontWeight.w300,
                    ),
                    textController: controller.searchController,
                    validator: (_) => null,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(ConstIcons.searchIcon),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: 12,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(9.5),
                  child: Row(
                    children: [
                      AppImageCircular(
                        path: 'assets/images/car.png',
                        height: 46,
                        width: 46,
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Customtext(
                            title: 'Jack Dawson',
                            textSize: AppSize.width(value: 14),
                            fontWeight: FontWeight.w500,
                          ),
                          Customtext(
                            title: 'Jack Dawson',
                            textSize: AppSize.width(value: 12),
                            fontWeight: FontWeight.w400,
                            textColor: ConstColour.cardBorderColour,
                          ),
                        ],
                      ),
                      Spacer(),
                      Customtext(
                        title: '09:01 am',
                        textSize: AppSize.width(value: 10),
                        fontWeight: FontWeight.w400,
                        textColor: ConstColour.cardBorderColour,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
