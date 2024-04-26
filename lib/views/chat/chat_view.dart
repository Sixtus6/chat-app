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
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ChatScreenViewModel(),
        onViewModelReady: (viewModel) => viewModel.initialize(),
        builder: ((context, viewModel, child) => Scaffold(
              appBar: AppBarWidget(title: group),
              backgroundColor: ColorConfig.white,
              body: Column(
                children: [
                  Chat(
                    theme: DefaultChatTheme(
                      backgroundColor: Colors.transparent,
                      primaryColor: ColorConfig.primary,
                      secondaryColor: ColorConfig.primary.withOpacity(0.6),
                      // secondaryColor: Colors.white30,
                      inputBackgroundColor: Colors.grey.shade900,
                    ),
                    showUserNames: true,
                    // messages: provider.messages,
                    // customMessageBuilder: v.customTextMessageBuilder,
                    textMessageOptions:
                        TextMessageOptions(isTextSelectable: true),
                    messages: viewModel.messages,

                    user: viewModel.user,
                    onSendPressed: viewModel.handleSendPressed,
                    // user:
                    //     User(id: widget.userid!, firstName: widget.firstname),
                    textMessageBuilder: viewModel.customTextMessageBuilders,
                  ).withSize(width: double.infinity).expand()
                ],
              ),
            )));
  }
}
