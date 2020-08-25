import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/util/config.dart';
import 'package:stockton/util/data_result.dart';
import 'package:stockton/util/http.dart';
import 'package:stockton/util/local_storage.dart';
import 'package:stockton/util/logger.dart';

class MemberRepository {
  static const ID = "id";
  static const PHONE_NUM = "phone_num";
  static const EMAIL = "email";
  static const ACCOUNT = "account";
  static const PASSWORD = "password";
  static const AVATAR = "avatar";
  static const GENDER = "gender";
  static const NICKNAME = "nickname";
  static const SALT = "salt";
  static const ONLINE = "online";
  static const TOKEN = "token";
  static const MEMO = "memo";
  static const CREATED_AT = "created_at";
  static const UPDATED_AT = "updated_at";
  static const DELETED_AT = "deleted_at";

  // 根据member_id获取member数据
  Stream<Member> getMemberStream(memberId) async* {
    Response response = await dio.get(Config.API_ADDRESS + "/v1/members/find",
        queryParameters: {"member_id": memberId});
    // ??? 会不会无限请求接口?
    yield _parseToMember(response);
  }

  // 根据group_id获取群内所有成员
  Stream<List<Member>> getMembersStream(groupId) async* {
    Response response = await dio.get(
        Config.API_ADDRESS + "/v1/contacts/find_group_members",
        queryParameters: {"group_id": groupId});
    // ??? 会不会无限请求接口?
    // 经验证不会无限请求接口
    yield _parseToMembers(response);
  }

  // !!! 我的理解 每当登入或登出返回一个member，即登入返回登入的member，登出返回空member
  Stream<Member> getAuthenticationStateChange() async* {
    // 拿本地缓存的memberId去服务器检测是否在线状态，在线即返回member，离线即返回空member
    int memberId;
    var res = await getLocalMemberInfo();
    if (res != null && res.result) {
      memberId = res.data.id;
      Response response = await dio.get(Config.API_ADDRESS + "/v1/members/find",
          queryParameters: {"member_id": memberId});
      Member member = _parseToMember(response);
      if (member.online == 1) {
        yield member;
      } else {
        yield null;
      }
    } else {
      yield null;
    }
  }

  // 获取本地登录用户信息
  static getLocalMemberInfo() async {
    var memberText = await LocalStorage.get(Config.MEMBER_INFO);
    if (memberText != null) {
      var memberMap = json.decode(memberText);
      Member member = Member.fromMap(memberText);
      return new DataResult(member, true);
    } else {
      return new DataResult(null, false);
    }
  }

  // 登入
  Future<Member> signIn(String email, String password) async {
    Member member = Member.init();
    FormData formData = FormData.fromMap({
      ACCOUNT: email, // !!! 以后要优化
      PASSWORD: password,
    });
    try {
      Response response = await dio.post(Config.API_ADDRESS + "/v0/members/login",
          data: formData);
      member = _parseToMember(response);
    } on DioError catch (e) {
      Logger.w("login error: ${e.response.statusCode} ${e.response.data['data']}", e: e);
    }

    return member;
  }

  Member _parseToMember(dynamic response) {
    if (response.data['code'] != 200) {
      return Member.init();
    }
    dynamic data = response.data['data'];
    return Member((m) => m
      ..id = data[ID]
      ..phoneNum = data[PHONE_NUM]
      ..avatar = data[AVATAR]
      ..gender = data[GENDER]
      ..nickname = data[NICKNAME]
      ..email = data[EMAIL]
      ..online = data[ONLINE]
      ..memo = data[MEMO]
      ..createdAt = data[CREATED_AT]
      ..updatedAt = data[UPDATED_AT]
      ..deletedAt = data[DELETED_AT]);
  }

  List<Member> _parseToMembers(dynamic response) {
    if (response.data['code'] != 200) {
      return [Member.init()];
    }
    dynamic data = response.data['data'];

    List<Member> members;
    for (int i = 0; i < data.length; i++) {
      members.add(Member((m) => m
        ..id = data[i][ID]
        ..phoneNum = data[i][PHONE_NUM]
        ..avatar = data[i][AVATAR]
        ..gender = data[i][GENDER]
        ..nickname = data[i][NICKNAME]
        ..email = data[i][EMAIL]
        ..phoneNum = data[i][ONLINE]
        ..memo = data[i][MEMO]
        ..createdAt = data[i][CREATED_AT]
        ..updatedAt = data[i][UPDATED_AT]
        ..deletedAt = data[i][DELETED_AT]));
    }
    return members;
  }

// 登出
  Future<void> logOut() async {
    await updateMemberToken(null);
    // !!! 因为用不到,这个地方省略了firebaseAuth的登出操作
  }

// 更新token
  Future<void> updateMemberToken(String token) {
    // 获取当前用户 currentMember
    // 更新currentMember token
  }

// 更新member
// 指定更新字段 如只能更新 昵称，头像
  Future<void> updateMember(Member member) async {}

// 更新显示语言
  Future<void> updateMemberLocale(String locale) async {}

  static toMap(Member member) {
    return {
      ID: member.id,
      NICKNAME: member.nickname,
      PHONE_NUM: member.phoneNum,
    };
  }
}
