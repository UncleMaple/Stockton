import 'package:stockton/util/config.dart';

///地址数据
class Address {
  static const String host = Config.API_ADDRESS;

  ///获取授权 get
  static getAuthorization() {
    return "$host/v0/auth/token";
  }

  ///查找member get
  static findMember() {
    return "$host/v1/members/find";
  }

  ///通过group_id查找group里所有member get
  static findGroupMembers() {
    return "$host/v1/contacts/find_group_members";
  }

  ///登入member post
  static loginMember() {
    return "$host/v0/members/login";
  }

  ///登出member get
  static logoutMember() {
    return "$host/v1/members/logout";
  }
}
