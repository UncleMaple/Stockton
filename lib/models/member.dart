import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:stockton/models/serializers.dart';

part 'member.g.dart';

abstract class Member implements Built<Member, MemberBuilder> {
  int get id;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;

  @nullable
  @BuiltValueField(wireName: 'deleted_at')
  String get deletedAt;

  @BuiltValueField(wireName: 'phone_num')
  String get phoneNum;

  @nullable
  @BuiltValueField(wireName: 'password')
  String get password;

  @nullable
  @BuiltValueField(wireName: 'email')
  String get email;

  // account 是登录时用到的，可以是邮箱或手机号，后端代码会自行判断
  @nullable
  @BuiltValueField(wireName: 'account')
  String get account;


  @nullable
  @BuiltValueField(wireName: 'avatar')
  String get avatar;

  String get gender;

  @nullable
  String get nickname;

  @nullable
  String get salt;

  @nullable
  int get online;

  @nullable
  String get token;

  @nullable
  String get memo;

  // 对应为groupId: [channelId], 标记未读的channels
  @nullable
  BuiltMap<String, BuiltList> get unreadUpdates;

  static Serializer<Member> get serializer => _$memberSerializer;

  String toJson() {
    return json.encode(serializers.serializeWith(Member.serializer, this));
  }

  factory Member.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Member.serializer,
      json.decode(jsonString),
    );
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(Member.serializer, this);
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Member.serializer,
      map,
    );
  }

  Member._();

  factory Member([void Function(MemberBuilder) updates]) = _$Member;

  factory Member.init() => Member((m) => m
    ..id = -1
    ..nickname = null); // 后续根据需要补全
}
