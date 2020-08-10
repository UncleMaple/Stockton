import "package:flutter/material.dart";
import 'package:stockton/models/message.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/theme.dart';

class SystemMessageItem extends StatelessWidget {
  final Message _message;

  const SystemMessageItem(
      this._message, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48 * AppTheme.pixelMultiplier,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppTheme.appMargin,
            right: AppTheme.appMargin,
          ),
          // Currently only dealing with SYSTEM or RSVP messages
          child: Text(_message.messageType == MessageType.SYSTEM ?
          StocktonLocalizations.of(context).channelSystemMessage(_message.body).toUpperCase() :
          StocktonLocalizations.of(context).rsvpSystemMessage(_message.body).toUpperCase(),
            style: AppTheme.systemMessageTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
