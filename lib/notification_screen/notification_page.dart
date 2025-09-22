import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widget/custom_text.dart';
import 'package:go_connect/utils/appSize.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarBlankWithBackButton(ConstString.notification),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 18, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/Mask.png'),
                    SizedBox(width: AppSize.width(value: 15)),
                    SizedBox(
                      width: AppSize.width(value: 280),
                      child: Customtext(
                        title:
                            'The Ferrari that you ordered has arrived at the 438 Sundance Br…The Ferrari that you ordered has arrived at the 438 Sundance Br…',
                        textSize: AppSize.width(value: 16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Customtext(
                      title: '34 minutes ago',
                      textSize: AppSize.width(value: 12),
                      textColor: ConstColour.cardBorderColour,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
