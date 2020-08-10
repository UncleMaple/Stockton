import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/models/channel.dart';
import 'package:stockton/presentation/channel/channel_screen_view_model.dart';
import 'package:stockton/presentation/channel/event/rsvp_dialog.dart';
import 'package:stockton/presentation/channel/event/rsvp_header.dart';
import 'package:stockton/presentation/channel/input/chat_input.dart';
import 'package:stockton/presentation/channel/join_channel.dart';
import 'package:stockton/presentation/channel/messages_section.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/channel/channel_actions.dart';
import 'package:stockton/presentation/channel/messages_scroll_controller.dart';

class ChannelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChannelScreenViewModel>(
      converter: ChannelScreenViewModel.fromStore,
      distinct: true,
      builder: (context, vm) {
        return MessagesScrollController(
          scrollController: ScrollController(),
          child: Column(
            children: _buildChildren(vm, context),
          ),
        );
      },
    );
  }
}

List<Widget> _buildChildren(ChannelScreenViewModel vm, BuildContext context) {
  final widgets = <Widget>[];

  if (vm.channel.type == ChannelType.EVENT &&
      vm.rsvpStatus == RSVP.UNSET &&
      vm.channel.startDate.isAfter(DateTime.now())) {
    _addRsvpHeader(context, widgets);
  }

  widgets.add(MessagesSection(
    key: Key("MessageSection ${vm.channel.name}"),
  ));

  if (vm.userIsMember) {
    widgets.add(ChatInput(
      key: Key("ChatInput ${vm.channel.name}"),
    ));
  } else {
    if (vm.failedToJoin) {
      // Placeholder until UI specs are ready
      widgets.add(AlertDialog(
        title: Text("Join channel failed"),
        content: Text("An error occured. Please try again!"),
        actions: <Widget>[
          FlatButton(
              child: Text("Ok"),
              onPressed: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(ClearFailedJoinAction());
              })
        ],
      ));
    }
    widgets.add(JoinChannel(vm.groupId, vm.channel, vm.member));
  }
  return widgets;
}

void _addRsvpHeader(BuildContext context, List<Widget> widgets) {
  final completer = Completer();
  completer.future.then((rsvp) => showDialogRsvp(context, rsvp));
  widgets.add(RsvpHeader(
    completer: completer,
  ));
}
