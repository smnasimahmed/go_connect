import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_connect/auth_screens/createAccount/createAccountPage.dart';
import 'package:go_connect/auth_screens/forgetPassword/forgetPasswordPage.dart';
import 'package:go_connect/auth_screens/forgetPasswordOTP/forgetPasswordOTPPage.dart';
import 'package:go_connect/auth_screens/resetPassword/resetPasswordPage.dart';
import 'package:go_connect/auth_screens/signIn/signInPage.dart';
import 'package:go_connect/auth_screens/verificationforAccount/verificationforAccountPage.dart';
import 'package:go_connect/cars_screens/cars_page.dart';
import 'package:go_connect/navbar/navbar.dart';
import 'package:go_connect/notification_screen/notification_page.dart';
import 'package:go_connect/profile_screen/about_us_screen/about_us_page.dart';
import 'package:go_connect/profile_screen/choose_language_screen/choose_language_page.dart';
import 'package:go_connect/profile_screen/delete_account_screen/delete_account_page.dart';
import 'package:go_connect/profile_screen/edit_profile_screen/edit_profile_page.dart';
import 'package:go_connect/profile_screen/faq_screens/faq_page.dart';
import 'package:go_connect/profile_screen/favourits_screen/favourits_page.dart';
import 'package:go_connect/profile_screen/password_screen/password_page.dart';
import 'package:go_connect/profile_screen/profile_page.dart';
import 'package:go_connect/profile_screen/terms_conditions_screen/terms_conditions_page.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/routes/bindings/authBindings.dart';

List<GetPage> appRouteFile = <GetPage>[
  GetPage(name: AppRoutes.navbar, page: () => Navbar()),
  GetPage(
    name: AppRoutes.createaccountpage,
    page: () => Createaccountpage(),
    binding: Authbindings(),
  ),
  GetPage(name: AppRoutes.signinpage, page: () => Signinpage(), binding: Authbindings()),
  GetPage(
    name: AppRoutes.verificationforaccountpage,
    page: () => Verificationforaccountpage(),
    binding: Authbindings(),
  ),
  GetPage(
    name: AppRoutes.forgetpasswordpage,
    page: () => Forgetpasswordpage(),
    binding: Authbindings(),
  ),
  GetPage(
    name: AppRoutes.forgetpasswordotppage,
    page: () => Forgetpasswordotppage(),
    binding: Authbindings(),
  ),
  GetPage(
    name: AppRoutes.resetpasswordpage,
    page: () => Resetpasswordpage(),
    binding: Authbindings(),
  ),

  //////////////// Home /////////////////////
  GetPage(name: AppRoutes.notifications, page: () => const NotificationPage()),

  //////////////// Profile Page /////////////////////
  GetPage(name: AppRoutes.profilePage, page: () => const ProfilePage()),
  GetPage(name: AppRoutes.editProfilePage, page: () => const EditProfilePage()),
  GetPage(name: AppRoutes.chooseLanguagePage, page: () => const ChooseLanguagePage()),
  GetPage(name: AppRoutes.favouritsPage, page: () => const FavouritsPage()),
  GetPage(name: AppRoutes.passwordPage, page: () => const PasswordPage()),
  GetPage(name: AppRoutes.aboutUsPage, page: () => const AboutUsPage()),
  GetPage(name: AppRoutes.termsConditionsPage, page: () => const TermsConditionsPage()),
  GetPage(name: AppRoutes.faqPage, page: () => const FaqPage()),
  GetPage(name: AppRoutes.deleteAccountPage, page: () => const DeleteAccountPage()),

  //////////////// Home /////////////////////
  GetPage(name: AppRoutes.carsPage, page: () => const CarsPage()),
];
