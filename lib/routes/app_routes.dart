// import 'package:go_connect/utils/storage_service.dart';

class AppRoutes {
  AppRoutes._();

  static String initialPage = '/';
  static const navbar = '/navbar';
  static const createaccountpage = '/Createaccountpage';
  static const signinpage = '/signinpage';
  static const verificationforaccountpage = '/verificationforaccountpage';
  static const forgetpasswordpage = '/forgetpasswordpage';
  static const forgetpasswordotppage = '/forgetpasswordotppage';
  static const resetpasswordpage = '/resetpasswordpage';
  static const homepage = '/homepage';
  static const notifications = "/notifications_screen.dart";

  /////////////// Profile Page ////////////////
  static const profilePage = "/profilePage";
  static const editProfilePage = "/editProfilePage";
  static const chooseLanguagePage = "/chooseLanguagePage";
  static const favouritsPage = "/favouritsPage";
  static const passwordPage = "/passwordPage";
  static const aboutUsPage = "/aboutUsPage";
  static const termsConditionsPage = "/termsConditionsPage";
  static const faqPage = "/faqPage";
  static const deleteAccountPage = "/deleteAccountPage";

  // static String initialPageFunction() {
  //   if (AppStorage().getStartingScreen() == false &&
  //       AppStorage().getLoginValue() == false) {
  //     return initialPage = getStartedScreens;
  //   } else if (AppStorage().getStartingScreen() == true &&
  //       AppStorage().getLoginValue() == true) {
  //     return initialPage = navbar;
  //   } else {
  //     return initialPage = signinpage;
  //   }
  // }
}
