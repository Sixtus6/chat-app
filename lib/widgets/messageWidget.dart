import 'package:chatapp/config/color.dart';
import 'package:chatapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: ColorConfig.white,
        child: ListTile(
          leading: Container(
            width: 40, // Adjust the size as needed
            height: 40, // Adjust the size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConfig.primary
                  .withOpacity(0.6), // Change the color as needed
            ),
            child: const Icon(
              Icons.group,
              size: 25, // Adjust the icon size as needed
              color: Colors.white, // Change the icon color as needed
            ),
          ),
          title: Text(
            'Group ${1}',
            style: titleStyle(context, false, size: 17, color: Colors.black87),
          ),
          subtitle: RichText(
            text: TextSpan(
              text: 'Message: ',
              style: TextStyle(
                  color: Colors.black
                      .withOpacity(0.7)), // Style for the whole text
              children: const [
                TextSpan(
                  text: 'Hi, how you doing?', // Current time
                  style: TextStyle(
                      color: Colors.black54), // Style for the time part
                ),
              ],
            ),
          ),
          // Display the user's name or title
          // subtitle: Text(
          //     'Message: Hi, how you doing?'), // Display the message content

          trailing: Text(
            DateFormat('HH:mm')
                .format(DateTime.now()), // Format the current time
          ),
        ));
  }
}
