import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.profilePage),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/car.png'),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtext(
                      textSize: AppSize.width(value: 20),
                      fontWeight: FontWeight.w600,
                      textColor: ConstColour.primaryColor,
                      title: "Hi,Samuel!",
                    ),
                    GestureDetector(
                      // onTap: () => Get.to(() => LocationSelectionScreen()),
                      child: Row(
                        children: [
                          Customtext(
                            textSize: 13,
                            fontWeight: FontWeight.w400,
                            textColor: ConstColour.textColor,
                            title: "Dugbe, Ibadan",
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: ConstColour.textColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.notifications),
              child: SvgPicture.asset(ConstIcons.notificationIcon, height: 24, width: 24),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90); // set custom height
}
