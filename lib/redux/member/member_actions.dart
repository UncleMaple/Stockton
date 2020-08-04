import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stockton/models/member.dart';

@immutable
class MembersUpdateAction {
  final List<Member> members;

  const MembersUpdateAction(this.members);
}

@immutable
class OnMemberUpdateAction { // !!! 这个地方的命名不舒服
  final Member member;

  const OnMemberUpdateAction(this.member);
}

@immutable
class UpdateMemberLocaleAction {
  final String locale;

  const UpdateMemberLocaleAction(this.locale);
}

@immutable
class UpdateMemberAction {
  final Member member;
  final Completer completer;

  const UpdateMemberAction(this.member, this.completer);
}
