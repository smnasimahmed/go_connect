import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/custom_widget/log_out_pop_up.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/appSize.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      ConstIcons.editProfileInformation,
      // ConstIcons.switchIntoHost,
      ConstIcons.chooseLanguage,
      ConstIcons.favorites,
      ConstIcons.password,
      ConstIcons.aboutUs,
      ConstIcons.termsAndConditions,
      ConstIcons.faq,
      ConstIcons.deleteAccount,
    ];
    List<String> itemsText = [
      ConstString.editProfileInformation,
      // ConstString.switchIntoHost,
      ConstString.chooseLanguage,
      ConstString.favorites,
      ConstString.password,
      ConstString.aboutUs,
      ConstString.termsAndConditions,
      ConstString.faq,
      ConstString.deleteAccount,
    ];

    List<String> pages = [
      AppRoutes.editProfilePage,
      AppRoutes.chooseLanguagePage,
      AppRoutes.favouritsPage,
      AppRoutes.passwordPage,
      AppRoutes.aboutUsPage,
      AppRoutes.termsConditionsPage,
      AppRoutes.faqPage,
      AppRoutes.deleteAccountPage,
    ];

    return Material(
      child: Scaffold(
        appBar: appBarBlankWithBackButton(ConstString.profile),
        bottomNavigationBar: LogOutOptions(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.width(value: 35)),
            AppImageCircular(
              path: 'assets/images/car.png',
              height: AppSize.width(value: 90),
              width: AppSize.width(value: 90),
            ),
            Customtext(
              top: AppSize.width(value: 10),
              title: 'Samuel Johnson',
              textSize: AppSize.width(value: 26),
              fontWeight: FontWeight.w500,
            ),
            Customtext(
              top: 2,
              bottom: AppSize.width(value: 35),
              title: ConstString.switchIntoHost,
              textColor: ConstColour.primaryColor,
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: AppSize.width(value: 2)),
            ...List.generate(icons.length, (index) {
              final page = pages[index];
              return InkWell(
                onTap: () => Get.toNamed(page),

                // onTap: () async {
                //   final page = pages[index];

                //   if (page.startsWith("http")) {
                //     // open external link
                //     await openInBrowser(page);
                //   } else {
                //     // navigate inside app
                //     Get.toNamed(page);
                //   }
                // },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.width(value: 11.69),
                    horizontal: AppSize.width(value: 24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        icons[index],
                        height: AppSize.width(value: 16.62),
                        width: AppSize.width(value: 16.62),
                      ),
                      SizedBox(width: AppSize.width(value: 9.05)),
                      Customtext(
                        title: itemsText[index],
                        textSize: AppSize.width(value: 15),
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class LogOutOptions extends StatelessWidget {
  const LogOutOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.width(value: 100),
      child: InkWell(
        onTap: () {
          logOutPopUp(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSize.width(value: 11.69),
            horizontal: AppSize.width(value: 24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ConstIcons.logOut,
                height: AppSize.width(value: 16.62),
                width: AppSize.width(value: 16.62),
              ),
              SizedBox(width: AppSize.width(value: 9.05)),
              Customtext(
                title: ConstString.logOut,
                textColor: Colors.red,
                textSize: AppSize.width(value: 15),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
