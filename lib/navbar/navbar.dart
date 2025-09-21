import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_colour.dart';
import 'package:go_connect/custom_widget/main_appbar.dart';
import 'package:go_connect/navbar/controller/navbar_controller.dart';
import 'package:go_connect/utils/appSize.dart';

// ignore: must_be_immutable
class Navbar extends StatelessWidget {
  Navbar({super.key});

  static const double drawerWidth = 290.0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;
    return GetBuilder(
      init: NavbarController(),
      builder: (controller) {
        return Scaffold(
          appBar: MainAppbar(),
          // key: scaffoldKey,
          bottomNavigationBar: _navbar(
            // controller.iconLabel,
            controller.icons,
            controller.selectedIndex,
          ),
          body: Obx(
            () => IndexedStack(
              index: controller.selectedIndex.value,
              children: controller.pages,
            ),
          ),
        );
      },
    );
  }

  Widget _navbar(List<String> icons, RxInt selectedIndex) {
    return Container(
      height: AppSize.width(value: 70),
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return _generateItem(icons, index, selectedIndex);
        }),
      ),
    );
  }

  Expanded _generateItem(List<String> icons, int index, RxInt selectedIndex) {
    return Expanded(
      child: Obx(
        () => InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: (selectedIndex.value == index)
                      ? ConstColour.tabButtonColour
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SvgPicture.asset(
                    icons[index],
                    colorFilter: ColorFilter.mode(
                      selectedIndex.value == index ? Colors.black : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          onTap: () => selectedIndex.value = index,
        ),
      ),
    );
  }
}

class SearchEngine extends StatelessWidget {
  const SearchEngine({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {},
      cursorColor: ConstColour.primaryColor,
      maxLines: 1,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.all(AppSize.width(value: 10)),
          child: SvgPicture.asset(
            'assets/icons/searchIcon.svg',
            height: AppSize.height(value: 18),
            width: AppSize.width(value: 18),
          ),
        ),
        hintMaxLines: 1,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'poppins',
        ),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
