import 'package:chatapp/config/color.dart';
import 'package:chatapp/views/chat/chat_viewmodel.dart';
import 'package:chatapp/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({super.key, required this.group});
  final String group;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ChatScreenViewModel(),
        builder: ((context, viewModel, child) => Scaffold(
              appBar: AppBarWidget(title: group),
              backgroundColor: ColorConfig.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Chat(
                      theme: DefaultChatTheme(
                        backgroundColor: Colors.transparent,
                        primaryColor: ColorConfig.primary,
                        secondaryColor: Color(0xff4d4d4d).withOpacity(0.7),
                        // secondaryColor: Colors.white30,
                        inputBackgroundColor: Colors.grey.shade900,
                      ),
                      showUserNames: true,
                      // messages: provider.messages,
                      //  customMessageBuilder: provider.customTextMessageBuilder,
                      textMessageOptions:
                          TextMessageOptions(isTextSelectable: true),
                      messages: [],
                      onSendPressed: (PartialText) {},
                      user: User(id: "widget.userid", firstName: "Sixtus"),
                      // onSendPressed: provider.handleSendPressed,

                      // onSendPressed: provider.handleSendPressed,
                      // user:
                      //     User(id: widget.userid!, firstName: widget.firstname),
                      // textMessageBuilder: provider.customTextMessageBuilders,
                    ).withSize(width: double.infinity).expand()
                  ],
                ),
              ),
            )));
  }
}
