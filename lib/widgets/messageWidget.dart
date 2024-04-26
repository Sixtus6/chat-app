import 'package:chatapp/config/color.dart';
import 'package:chatapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.title,
    this.message,
  });
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: ColorConfig.white,
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConfig.primary.withOpacity(0.6),
            ),
            child: const Icon(
              Icons.group,
              size: 25,
              color: Colors.white,
            ),
          ),
          title: Text(
            title ?? 'Group ${1}',
            style: titleStyle(context, false, size: 17, color: Colors.black87),
          ),
          subtitle: RichText(
            text: TextSpan(
              text: 'Message: ',
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
              children: [
                TextSpan(
                  text: message ?? 'Hi, how you doing?',
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          trailing: Text(
            DateFormat('HH:mm').format(DateTime.now()),
          ),
        ));
  }
}
