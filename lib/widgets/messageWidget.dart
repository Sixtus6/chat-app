import 'package:chatapp/config/color.dart';
import 'package:chatapp/utils/style.dart';
import 'package:chatapp/widgets/customCircleAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.title,
    this.message,
    this.counter,
  });
  final String? title;
  final String? message;
  final String? counter;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: ColorConfig.white,
        child: ListTile(
          leading: Stack(children: [
            CustomCircleAvater(
              color: ColorConfig.primary.withOpacity(0.6),
              radius: 40,
              widget: const Icon(
                Icons.group,
                size: 25,
                color: Colors.white,
              ),
            ),
            Positioned(
              right: 4,
              //rtop: -4,
              child: CustomCircleAvater(
                  color: Colors.green,
                  radius: 13,
                  widget: Text(
                    counter ?? '1',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ).center().paddingBottom(2)),
            )
          ]),
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
          trailing: Column(
            children: [
              Text(
                DateFormat('HH:mm').format(DateTime.now()),
              ),
              Icon(
                Icons.check_circle,
                size: 15,
              )
            ],
          ).paddingSymmetric(vertical: 10),
        ));
  }
}
