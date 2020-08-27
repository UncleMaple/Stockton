import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/util/config.dart';
import 'package:stockton/util/data_result.dart';
import 'package:stockton/util/net/address.dart';
import 'package:stockton/util/net/api.dart';
import 'package:stockton/util/local_storage.dart';
import 'package:stockton/util/logger.dart';
import 'package:stockton/util/net/result_data.dart';

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
    ResultData res = await httpManager.netFetch(
        Address.findMember(), {"member_id": memberId}, null, null);
    yield _parseToMember(res);
  }

  // 根据group_id获取群内所有成员
  Stream<List<Member>> getMembersStream(groupId) async* {
    var res = await httpManager.netFetch(
        Address.findGroupMembers(), {"group_id": groupId}, null, null);
    yield _parseToMembers(res);
  }

  // !!! 每当登入或登出返回一个member，即登入返回登入的member，登出返回空member
  Stream<Member> getAuthenticationStateChange() async* {
    // 拿本地缓存的memberId去服务器检测是否在线状态，在线即返回member，离线即返回空member
    // !!!后续需要优化
    int memberId;
    var dataRes = await getLocalMemberInfo();
    if (dataRes != null && dataRes.result) {
      memberId = dataRes.data.id;
      var res = await httpManager.netFetch(
          Address.findMember(), {"member_id": memberId}, null, null);
      Member member = _parseToMember(res);
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
      Member member = Member.fromMap(memberMap);
      return new DataResult(member, true);
    } else {
      return new DataResult(null, false);
    }
  }

  // 登入
  Future<Member> signIn(String account, String password) async {
    FormData formData = FormData.fromMap({
      ACCOUNT: account, // !!! 以后要优化
      PASSWORD: password,
    });
    var res = await httpManager.netFetch(
        Address.loginMember(),
        formData,
        null,
        new Options(method: 'POST'));
    Member member = _parseToMember(res);

    // !!! 同步本地数据
    LocalStorage.save(Config.MEMBER_ID, member.id?.toString());

    return member;
  }

  Member _parseToMember(ResultData res) {
    if (res != null && res.result && res.data["id"] != 0) {
      dynamic data = res.data['data'];
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
    } else {
      return Member.init();
    }
  }

  List<Member> _parseToMembers(ResultData res) {
    if (res == null || !res.result) {
      return [];
    }
    var data = res.data['data'];

    List<Member> members;
    for (int i = 0; i < data.length; i++) {
      members.add(
        Member((m) => m
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
          ..deletedAt = data[i][DELETED_AT]),
      );
    }
    return members;
  }

  /// 登出
  Future<void> logOut() async {
    // await updateMemberToken(null);
    var memberId = LocalStorage.get(Config.MEMBER_ID);
    // 服务端在登出时自动把token设为null
    var res = await httpManager.netFetch(
        Address.logoutMember(), {"member_id": memberId}, null, null);

    if (res == null || !res.result) {
      Logger.d("Logout fail: $memberId", e: res);
    }
  }

  /// 更新本地token
  Future<void> updateMemberToken(String token) {
    LocalStorage.save(Config.MEMBER_TOKEN, token);
    return null;
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
