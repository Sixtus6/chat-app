import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:chatapp/config/color.dart';
import 'package:chatapp/config/size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatScreenViewModel extends BaseViewModel {
  final user = const types.User(
      id: "82091008-a484-4a89-ae75-a22bf8d6f3ac", firstName: "Sixtus");

  final micahel = types.User(
    id: 'micahel',
    firstName: 'Recipient',
    imageUrl: 'https://example.com/recipient_image.jpg',
  );

  // Dummy user for the current user
  final francis = types.User(
    id: 'francis',
    firstName: 'Current User',
    imageUrl:
        'https://example.com/current_user_image.jpg', // URL to current user's image
  );

  String randomStringID() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    print(values);
    return base64UrlEncode(values);
  }

  List<types.Message> messages = [];

  void addMessage(types.Message message) {
    messages.insert(0, message);
    notifyListeners();
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomStringID(),
      text: message.text,
    );
    print(textMessage);
    addMessage(textMessage);
    notifyListeners();
  }

  void updateMessage(types.TextMessage message) {
    messages.insert(0, message);
    notifyListeners();
  }

  void initialize() {
    messages = <types.Message>[
      types.TextMessage(
        author: micahel,
        id: 'message_id_1',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: 'Hello, how are you?',
      ),
      types.TextMessage(
        author: francis,
        id: 'message_id_2',
        createdAt: DateTime.now().millisecondsSinceEpoch + 1000,
        text: 'Hi there!',
      ),
    ];
  }

  Widget customTextMessageBuilders(types.TextMessage message,
      {required int messageWidth, required bool showName}) {
    final isRecipientMessage = message.author.id != 'sender_user_id';
    final senderName = isRecipientMessage
        ? message.author.firstName ?? "sender"
        : 'Sender'; // Use a default name for sender messages
    final messageTime = DateTime.fromMillisecondsSinceEpoch(message.createdAt!);
    final time = DateFormat.Hm().format(messageTime);

    // Customize the appearance of the text message
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfigs.getPercentageWidth(2)),
      decoration: BoxDecoration(
        //  color: isRecipientMessage ? Colors.transparent : Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfigs.getPercentageWidth(4),
            right: SizeConfigs.getPercentageWidth(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showName) // Check if showName is true
              Text(
                isRecipientMessage
                    ? capitalizeFirstLetter(message.author.firstName!)
                    : senderName,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: ColorConfig.white),
              ),
            Text(
              message.text,
              style: TextStyle(
                color: isRecipientMessage ? ColorConfig.white : Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
