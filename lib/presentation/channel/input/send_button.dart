import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import 'package:stockton/presentation/channel/messages_scroll_controller.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/message/message_actions.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/theme.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key key,
    @required TextEditingController controller,
    @required bool enabled,
  })  : _controller = controller,
        _enabled = enabled,
        super(key: key);

  final TextEditingController _controller;
  final bool _enabled;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        StocktonLocalizations.of(context).channelInputSend,
        style: AppTheme.buttonTextStyle,
      ),
      padding: EdgeInsets.all(16),
      disabledTextColor: AppTheme.colorTextDisabled,
      textColor: AppTheme.colorTextEnabled,
      onPressed: !_enabled
          ? null
          : () {
        final text = _controller.text;
        _controller.clear();
        StoreProvider.of<AppState>(context).dispatch(
          SendMessage(text),
        );
        MessagesScrollController.of(context).scrollController.animateTo(
          0.0,
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        );
      },
    );
  }
}
