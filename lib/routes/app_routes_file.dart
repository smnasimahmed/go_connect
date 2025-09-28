import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_connect/auth_screens/createAccount/createAccountPage.dart';
import 'package:go_connect/auth_screens/forgetPassword/forgetPasswordPage.dart';
import 'package:go_connect/auth_screens/forgetPasswordOTP/forgetPasswordOTPPage.dart';
import 'package:go_connect/auth_screens/resetPassword/resetPasswordPage.dart';
import 'package:go_connect/auth_screens/signIn/signInPage.dart';
import 'package:go_connect/auth_screens/verificationforAccount/verificationforAccountPage.dart';
import 'package:go_connect/booking_details_screen/booking_details_page.dart';
import 'package:go_connect/car_details_screen/car_details_page.dart';
import 'package:go_connect/cars_screens/cars_page.dart';
import 'package:go_connect/check_in_screen/check_in_page.dart';
import 'package:go_connect/filter_by_screens/filter_by_page.dart';
import 'package:go_connect/inbox_screen.dart/inbox_screen_page.dart';
import 'package:go_connect/navbar/navbar.dart';
import 'package:go_connect/notification_screen/notification_page.dart';
import 'package:go_connect/owner_details/owner_details_page.dart';
import 'package:go_connect/profile_screen/about_us_screen/about_us_page.dart';
import 'package:go_connect/profile_screen/choose_language_screen/choose_language_page.dart';
import 'package:go_connect/profile_screen/delete_account_screen/delete_account_page.dart';
import 'package:go_connect/profile_screen/edit_profile_screen/edit_profile_page.dart';
import 'package:go_connect/profile_screen/faq_screens/faq_page.dart';
import 'package:go_connect/profile_screen/favourits_screen/favourits_page.dart';
import 'package:go_connect/profile_screen/password_screen/password_page.dart';
import 'package:go_connect/profile_screen/profile_page.dart';
import 'package:go_connect/profile_screen/re_submit_kyc_screen/re_submit_kyc_page.dart';
import 'package:go_connect/profile_screen/terms_conditions_screen/terms_conditions_page.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/routes/bindings/authBindings.dart';
import 'package:go_connect/short_by_screen/short_by_page.dart';

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
  GetPage(name: AppRoutes.reSubmitKycPage, page: () => const ReSubmitKycPage()),
  GetPage(name: AppRoutes.favouritsPage, page: () => const FavouritsPage()),
  GetPage(name: AppRoutes.passwordPage, page: () => const PasswordPage()),
  GetPage(name: AppRoutes.aboutUsPage, page: () => const AboutUsPage()),
  GetPage(name: AppRoutes.termsConditionsPage, page: () => const TermsConditionsPage()),
  GetPage(name: AppRoutes.faqPage, page: () => const FaqPage()),
  GetPage(name: AppRoutes.deleteAccountPage, page: () => const DeleteAccountPage()),

  //////////////// Home /////////////////////
  GetPage(name: AppRoutes.carsPage, page: () => const CarsPage()),
  GetPage(name: AppRoutes.carDetailsPage, page: () => const CarDetailsPage()),
  GetPage(name: AppRoutes.ownerDetailsPage, page: () => const OwnerDetailsPage()),
  GetPage(name: AppRoutes.bookingDetailsPage, page: () => const BookingDetailsPage()),
  GetPage(name: AppRoutes.checkIN, page: () => const CheckInPage()),
  GetPage(name: AppRoutes.filterByPage, page: () => const FilterByPage()),
  GetPage(name: AppRoutes.shortByPage, page: () => const ShortByPage()),

  //////////////// Home /////////////////////
  GetPage(name: AppRoutes.inboxScreenPage, page: () => const InboxScreenPage()),
];
