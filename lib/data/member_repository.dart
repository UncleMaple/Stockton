import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:stockton/models/member.dart';

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
  Stream<Member> getMemberStream(memberId) {
    return null;
  }

  // 根据group_id获取群内所有成员
  Stream<List<Member>> getMembersStream(groupId) {
    return null;
  }

  // !!! 没搞懂这个，可能和firebase有关
  Stream<Member> getAuthenticationStateChange() {

  }

  // 登入
  Future<Member> signIn(String email, String password) async {
    Dio dio = new Dio();
    FormData formData = FormData.fromMap({
      EMAIL: email,
      PASSWORD: password,
    });
    Response response = await dio.post("localhost:5288/login", data: formData);
    print(response.data.toString());
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
  Future<void> updateMember(Member member) async {

  }

  // 更新显示语言
  Future<void> updateMemberLocale(String locale) async {

  }

  static toMap(Member member) {
    return{
      ID: member.id,
      NICKNAME: member.nickname,
      PHONE_NUM: member.phoneNum,
    };
  }

}
