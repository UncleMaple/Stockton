import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/theme.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget _action;
  final Widget _leftAction;
  final String _title;
  final String _subtitle;

  const CommonAppBar({
    Widget action,
    Widget leftAction,
    @required String title,
    String subtitle,
    Key key,
  })  : _action = action,
        _leftAction = leftAction,
        _title = title,
        _subtitle = subtitle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        height: AppTheme.appBarSize,
        decoration: BoxDecoration(
          color: AppTheme.colorDeepBlack,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Visibility(
              visible: _leftAction == null,
              child: Container(
                width: 100.0, // Minimum size of a flat button
                child: FlatButton(
                    child: Text(
                      StocktonLocalizations.of(context).back,
                      style: AppTheme.buttonTextStyle,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              replacement: _leftAction ?? SizedBox.shrink(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: _subtitle == null
                        ? AppTheme.appBarTitleTextStyle
                        : AppTheme.appBarTitle2TextStyle,
                  ),
                  Visibility(
                    visible: _subtitle != null,
                    child: Text(
                      _subtitle ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.appBarSubtitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100.0, // Minimum size of a flat button
              child: _action,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppTheme.appBarSize);
}
