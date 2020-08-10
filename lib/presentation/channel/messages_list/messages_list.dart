import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import 'package:stockton/models/message.dart';
import 'package:stockton/presentation/channel/message/message_item.dart';
import 'package:stockton/presentation/channel/message/system_message_item.dart';
import 'package:stockton/presentation/channel/messages_list/messages_list_view_model.dart';
import 'package:stockton/redux/app_state.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        // On iOS, taping on the chat section dismisses keyboard
        if (Platform.isIOS) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: StoreConnector<AppState, MessagesListViewModel>(
        builder: (context, vm) {
          return ListView.builder(
              controller: scrollController,
              reverse: true,
              itemCount: vm.messages.length,
              itemBuilder: (context, index) {
                final message = vm.messages[index];
                return _selectMessageBuilder(message, vm);
              });
        },
        converter: MessagesListViewModel.fromStore,
        distinct: true,
      ),
    );
  }

  Widget _selectMessageBuilder(
      Message message,
      MessagesListViewModel vm,
      ) {
    switch (message.messageType) {
      case MessageType.SYSTEM:
      case MessageType.RSVP:
        return SystemMessageItem(message);
        break;
      case MessageType.MEMBER:
      case MessageType.MEDIA:
        return MessageItem(
          message: message,
          currentMember: vm.currentMember,
          memberIsMe: vm.memberIsMe,
          author: vm.authors[message.authorId],
        );
        break;
      default:
        return SizedBox.shrink();
    }
  }
}
