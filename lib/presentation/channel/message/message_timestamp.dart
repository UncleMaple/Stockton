import "package:flutter/material.dart";
import "package:intl/intl.dart";
import 'package:stockton/models/member.dart';
import 'package:stockton/models/message.dart';
import 'package:stockton/util/theme.dart';

class MessageTimestamp extends StatelessWidget {
  const MessageTimestamp({
    Key key,
    @required Message message,
    @required Member currentMember,
  })  : _message = message,
        _currentMember = currentMember,
        super(key: key);

  final Message _message;
  final Member _currentMember;

  @override
  Widget build(BuildContext context) {
    final timestamp = Text(
      DateFormat.Hm().format(_message.timestamp),
      style: AppTheme.messageTimestampTextStyle,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: AnimatedSwitcher(
          child: _message.authorId == _currentMember.id && _message.pending
              ? _buildLoading()
              : timestamp,
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Icon(
      Icons.cached,
      size: 16.0,
      color: Colors.grey,
    );
  }
}
