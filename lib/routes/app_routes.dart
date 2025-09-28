// import 'package:go_connect/utils/storage_service.dart';

class AppRoutes {
  AppRoutes._();

  static const carsPage = '/carsPage';

  //////////////// Auth Part ///////////////////////
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
  static const reSubmitKycPage = "/reSubmitKycPage";
  static const favouritsPage = "/favouritsPage";
  static const passwordPage = "/passwordPage";
  static const aboutUsPage = "/aboutUsPage";
  static const termsConditionsPage = "/termsConditionsPage";
  static const faqPage = "/faqPage";
  static const deleteAccountPage = "/deleteAccountPage";

  ////////////Others Page /////////////////
  static const carDetailsPage = '/carDetailsPage';
  static const ownerDetailsPage = '/ownerDetailsPage';
  static const bookingDetailsPage = '/bookingDetailsPage';
  static const checkIN = '/checkIN';
  static const filterByPage = '/filterByPage';
  static const shortByPage = '/shortByPage';
  static const inboxScreenPage = '/inboxScreenPage';

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
