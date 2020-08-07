import 'package:flutter/material.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacySettingsButton extends StatelessWidget {
  const PrivacySettingsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(StocktonLocalizations.of(context).privacyButton),
      onPressed: (){
        launch(StocktonLocalizations.of(context).privacyLink);
      },
    );
  }
}
