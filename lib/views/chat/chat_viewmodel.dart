import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:chatapp/config/color.dart';
import 'package:chatapp/config/size.dart';
import 'package:chatapp/model/chatmesage.model.dart';
import 'package:chatapp/services/api/api_client.dart';
import 'package:chatapp/services/api/end_point.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatScreenViewModel extends BaseViewModel {
  final user = const types.User(
      id: "82091008-a484-4a89-ae75-a22bf8d6f3ac", firstName: "Sixtus");

  String randomStringID() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    print(values);
    return base64UrlEncode(values);
  }

  List<types.Message> messages = [];

  addMessage(types.Message message) {
    print(messages);
    messages.insert(0, message);
    print(":added");
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
    initialize();
    //initialize();
  }

  void updateMessage(types.TextMessage message) {
    messages.insert(0, message);
    notifyListeners();
  }

  getRandomEndpoint(List<String> endpoints) {
    endpoints.shuffle();
    return endpoints.first;
  }

  Future<void> initialize() async {
    List<String> allChatRoom = [
      Endpoints.chatRoom1,
      Endpoints.chatRoom2,
      Endpoints.chatRoom3
    ];
    try {
      var data = await ApiClient()
          .fetchData(getRandomEndpoint(allChatRoom).toString());
      var response = ChatMessage.fromJson(data["data"]);
      print(getRandomEndpoint(allChatRoom).toString());
      final userInstance = types.User(
        id: randomStringID(),
        firstName: capitalizeFirstLetter(response.sender),
      );
      types.Message chat = types.TextMessage(
        author: userInstance,
        id: randomStringID(),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: response.message,
      );

      addMessage(chat);
    } catch (e) {
      print(e);
    }
  }

  Widget customTextMessageBuilders(types.TextMessage message,
      {required int messageWidth, required bool showName}) {
    final isRecipientMessage = message.author.id != 'sender_user_id';
    final senderName = isRecipientMessage
        ? message.author.firstName ?? "sender"
        : 'Sender'; // Use a default name for sender messages
    final messageTime = DateTime.fromMillisecondsSinceEpoch(message.createdAt!);
    final time = DateFormat.Hm().format(messageTime);
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
            if (showName)
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
