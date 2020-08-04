// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Member> _$memberSerializer = new _$MemberSerializer();

class _$MemberSerializer implements StructuredSerializer<Member> {
  @override
  final Iterable<Type> types = const [Member, _$Member];
  @override
  final String wireName = 'Member';

  @override
  Iterable<Object> serialize(Serializers serializers, Member object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'phone_num',
      serializers.serialize(object.phoneNum,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender,
          specifiedType: const FullType(String)),
    ];
    if (object.updatedAt != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.deletedAt != null) {
      result
        ..add('deleted_at')
        ..add(serializers.serialize(object.deletedAt,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.account != null) {
      result
        ..add('account')
        ..add(serializers.serialize(object.account,
            specifiedType: const FullType(String)));
    }
    if (object.avatar != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(object.avatar,
            specifiedType: const FullType(String)));
    }
    if (object.nickname != null) {
      result
        ..add('nickname')
        ..add(serializers.serialize(object.nickname,
            specifiedType: const FullType(String)));
    }
    if (object.salt != null) {
      result
        ..add('salt')
        ..add(serializers.serialize(object.salt,
            specifiedType: const FullType(String)));
    }
    if (object.online != null) {
      result
        ..add('online')
        ..add(serializers.serialize(object.online,
            specifiedType: const FullType(int)));
    }
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    if (object.memo != null) {
      result
        ..add('memo')
        ..add(serializers.serialize(object.memo,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Member deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MemberBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deleted_at':
          result.deletedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_num':
          result.phoneNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nickname':
          result.nickname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'salt':
          result.salt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'online':
          result.online = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'memo':
          result.memo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Member extends Member {
  @override
  final int id;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String deletedAt;
  @override
  final String phoneNum;
  @override
  final String password;
  @override
  final String email;
  @override
  final String account;
  @override
  final String avatar;
  @override
  final String gender;
  @override
  final String nickname;
  @override
  final String salt;
  @override
  final int online;
  @override
  final String token;
  @override
  final String memo;

  factory _$Member([void Function(MemberBuilder) updates]) =>
      (new MemberBuilder()..update(updates)).build();

  _$Member._(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.phoneNum,
      this.password,
      this.email,
      this.account,
      this.avatar,
      this.gender,
      this.nickname,
      this.salt,
      this.online,
      this.token,
      this.memo})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Member', 'id');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Member', 'createdAt');
    }
    if (phoneNum == null) {
      throw new BuiltValueNullFieldError('Member', 'phoneNum');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('Member', 'gender');
    }
  }

  @override
  Member rebuild(void Function(MemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemberBuilder toBuilder() => new MemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Member &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt &&
        phoneNum == other.phoneNum &&
        password == other.password &&
        email == other.email &&
        account == other.account &&
        avatar == other.avatar &&
        gender == other.gender &&
        nickname == other.nickname &&
        salt == other.salt &&
        online == other.online &&
        token == other.token &&
        memo == other.memo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc($jc(0, id.hashCode),
                                                            createdAt.hashCode),
                                                        updatedAt.hashCode),
                                                    deletedAt.hashCode),
                                                phoneNum.hashCode),
                                            password.hashCode),
                                        email.hashCode),
                                    account.hashCode),
                                avatar.hashCode),
                            gender.hashCode),
                        nickname.hashCode),
                    salt.hashCode),
                online.hashCode),
            token.hashCode),
        memo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Member')
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('deletedAt', deletedAt)
          ..add('phoneNum', phoneNum)
          ..add('password', password)
          ..add('email', email)
          ..add('account', account)
          ..add('avatar', avatar)
          ..add('gender', gender)
          ..add('nickname', nickname)
          ..add('salt', salt)
          ..add('online', online)
          ..add('token', token)
          ..add('memo', memo))
        .toString();
  }
}

class MemberBuilder implements Builder<Member, MemberBuilder> {
  _$Member _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  String _deletedAt;
  String get deletedAt => _$this._deletedAt;
  set deletedAt(String deletedAt) => _$this._deletedAt = deletedAt;

  String _phoneNum;
  String get phoneNum => _$this._phoneNum;
  set phoneNum(String phoneNum) => _$this._phoneNum = phoneNum;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _account;
  String get account => _$this._account;
  set account(String account) => _$this._account = account;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  String _nickname;
  String get nickname => _$this._nickname;
  set nickname(String nickname) => _$this._nickname = nickname;

  String _salt;
  String get salt => _$this._salt;
  set salt(String salt) => _$this._salt = salt;

  int _online;
  int get online => _$this._online;
  set online(int online) => _$this._online = online;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _memo;
  String get memo => _$this._memo;
  set memo(String memo) => _$this._memo = memo;

  MemberBuilder();

  MemberBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _deletedAt = _$v.deletedAt;
      _phoneNum = _$v.phoneNum;
      _password = _$v.password;
      _email = _$v.email;
      _account = _$v.account;
      _avatar = _$v.avatar;
      _gender = _$v.gender;
      _nickname = _$v.nickname;
      _salt = _$v.salt;
      _online = _$v.online;
      _token = _$v.token;
      _memo = _$v.memo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Member other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Member;
  }

  @override
  void update(void Function(MemberBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Member build() {
    final _$result = _$v ??
        new _$Member._(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            phoneNum: phoneNum,
            password: password,
            email: email,
            account: account,
            avatar: avatar,
            gender: gender,
            nickname: nickname,
            salt: salt,
            online: online,
            token: token,
            memo: memo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
