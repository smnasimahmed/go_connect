import 'package:get/get.dart';

class InboxScreenController extends GetxController {
  List<Inbox> chatMessages = [
    Inbox(
      imagePath: 'assets/images/car.png',
      userID: '0',
      message: 'how are you kamila?',
      time: '09:01 am',
    ),
    Inbox(
      imagePath: 'assets/images/car.png',
      userID: 'any',
      message: 'im fine and you ?',
      time: '09:01 am',
    ),
    Inbox(
      imagePath: 'assets/images/car.png',
      userID: '0',
      message: 'Fine, I really the house.',
      time: '09:01 am',
    ),
    Inbox(
      imagePath: 'assets/images/car.png',
      userID: 'any',
      message: 'My Pleasure dear.',
      time: '09:01 am',
    ),
    Inbox(
      imagePath: 'assets/images/car.png',
      userID: '0',
      message: 'okay, so there some issues with my car..a the door lock doesn\'t work.',
      time: '09:02 am',
    ),
  ];

  String myID = '0';
}

class Inbox {
  final String imagePath;
  final String userID;
  final String message;
  final String time;

  Inbox({
    required this.imagePath,
    required this.userID,
    required this.message,
    required this.time,
  });
}
