import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final localizationsDelegates = <LocalizationsDelegate>[
  const StocktonLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  const FallbackCupertinoLocalisationsDelegate()
];

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) => false;
}

class StocktonLocalizationsDelegate
    extends LocalizationsDelegate<StocktonLocalizations> {
  const StocktonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  Future<StocktonLocalizations> load(Locale locale) {
    return SynchronousFuture<StocktonLocalizations>(
        StocktonLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<StocktonLocalizations> old) {
    return false;
  }
}

class StocktonLocalizations {
  StocktonLocalizations(this.locale);

  final Locale locale;

  static StocktonLocalizations of(BuildContext context) {
    return Localizations.of<StocktonLocalizations>(
        context, StocktonLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {
      // Auth
      "log_out": "Log out",
      "log_in": "Log in",
      "hello_name": "Hello {name}!",
      "login_fail_member_not_found": "Login failed. No such member exists.",
      "login_fail": "Login failed. Code: '{code}'",
      // Privacy
      "privacy_button": "Privacy policy",
      "privacy_link": "https://www.baidu.com/",
      // generic
      "generic_soon_alert_title": "We are working on it",
      "generic_soon_alert_message":
          "This functionality will be available soon.",
      "generic_yes": "Yes",
      "generic_cancel": "Cancel",
      "generic_next": "Next",
      "generic_ok": "OK",
      "generic_back": "Back",
      "generic_at": "at",
      "generic_you": "You",
      "generic_save": "Save",
      "generic_edit": "Edit",
      "generic_delete": "Delete",
      "generic_invite": "Invite",
    },
    "ch": {
      // Auth
      "log_out": "登出",
      "log_in": "登入",
      "hello_name": "你好 {name}!",
      "login_fail_member_not_found": "登录失败, 该用户不存在",
      "login_fail": "登录失败, 错误: '{code}'",
      // Privacy
      "privacy_button": "隐私保护",
      "privacy_link": "https://www.baidu.com/",
      // generic
      "generic_soon_alert_title": "We are working on it",
      "generic_soon_alert_message":
          "This functionality will be available soon.",
      "generic_yes": "好的",
      "generic_cancel": "取消",
      "generic_next": "下一个",
      "generic_ok": "OK",
      "generic_back": "返回",
      "generic_at": "在",
      "generic_you": "你",
      "generic_save": "保存",
      "generic_edit": "编辑",
      "generic_delete": "删除",
      "generic_invite": "邀请",
    }
  };

  String _localizedValue(String id) =>
      _localizedValues[locale.languageCode][id] ?? _localizedValues["en"][id];

  // Auth
  String get logIn {
    return _localizedValue("log_in");
  }

  String get logOut {
    return _localizedValue("log_out");
  }

  String authErrorMessage(String code) {
    switch (code) {
      case "ERROR_MEMBER_NOT_FOUND":
        return _localizedValue("login_fail_member_not_found");
      default:
        return _localizedValue("login_fail").replaceAll("{code}", code);
    }
  }

  // Privacy
  String get privacyButton => _localizedValue("privacy_button");

  String get privacyLink => _localizedValue("privacy_link");

  // generic
  String get at => _localizedValue("generic_at");
}
