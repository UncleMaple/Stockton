import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:stockton/stockton_localization.dart';

enum AccessResourceType { CAMERA, STORAGE }

// 没有权限获取相机或存储
showNoAccessAlert({
  AccessResourceType type,
  BuildContext context,
}) {
  final dialog = PlatformAlertDialog(
    title: Text(StocktonLocalizations.of(context).platformAlertAccessTitle),
    content:
        Text(StocktonLocalizations.of(context).platformAlertAccessBody(type)),
    actions: [
      PlatformDialogAction(
        child: PlatformText(StocktonLocalizations.of(context).ok),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );

  return showPlatformDialog(
    context: context,
    builder: (_) => dialog,
  );
}

showSoonAlert({BuildContext context}) {
  final actions = [
    PlatformDialogAction(
      child: PlatformText(StocktonLocalizations.of(context).cancel),
      onPressed: () {
        Navigator.pop(context);
      },
    )
  ];

  return showPlatformDialog(context: context, builder: (_) => PlatformAlertDialog(
    title: Text(StocktonLocalizations.of(context).genericSoonAlertTitle),
    content: Text(StocktonLocalizations.of(context).genericSoonAlertMessage),
    actions: actions,
  ));
}
