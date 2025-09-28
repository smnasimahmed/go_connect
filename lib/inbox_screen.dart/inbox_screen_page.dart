import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widget/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/inbox_screen.dart/controller/inbox_screen_controller.dart';
import 'package:go_connect/utils/appSize.dart';

class InboxScreenPage extends StatelessWidget {
  const InboxScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        actions: [SvgPicture.asset(ConstIcons.threeDotMenuIcon), SizedBox(width: 12)],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImageCircular(path: 'assets/images/car.png', height: 46, width: 46),
            SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customtext(
                  title: 'kamila',
                  textSize: AppSize.width(value: 18),
                  fontWeight: FontWeight.w400,
                ),
                Customtext(
                  title: 'active now',
                  textSize: AppSize.width(value: 12),
                  fontWeight: FontWeight.w400,
                  textColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),

      body: GetBuilder(
        init: InboxScreenController(),
        builder: (controller) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            itemCount: controller.chatMessages.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: controller.myID == controller.chatMessages[index].userID
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                controller.myID != controller.chatMessages[index].userID
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: AppImageCircular(
                          path: controller.chatMessages[index].imagePath,
                          height: 36,
                        ),
                      ),
                Column(
                  crossAxisAlignment:
                      controller.myID == controller.chatMessages[index].userID
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: AppSize.width(value: 246),
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 10,
                          maxWidth: AppSize.width(value: 246),
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: controller.myID == controller.chatMessages[index].userID
                              ? const Color.fromARGB(87, 0, 150, 135)
                              : ConstColour.textColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft:
                                controller.myID != controller.chatMessages[index].userID
                                ? Radius.circular(10)
                                : Radius.circular(0),
                            bottomRight:
                                controller.myID == controller.chatMessages[index].userID
                                ? Radius.circular(10)
                                : Radius.circular(0),
                          ),
                        ),
                        child: Customtext(
                          title: controller.chatMessages[index].message,
                          textColor:
                              controller.myID == controller.chatMessages[index].userID
                              ? ConstColour.textColor
                              : Colors.white,
                        ),
                      ),
                    ),
                    Customtext(
                      title: controller.chatMessages[index].time,
                      textColor: ConstColour.cardBorderColour,
                      textSize: AppSize.width(value: 8),
                      fontWeight: FontWeight.w400,
                      // textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
