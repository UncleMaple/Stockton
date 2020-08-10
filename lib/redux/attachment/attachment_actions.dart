import "dart:io";

import "package:flutter/cupertino.dart";
import "package:meta/meta.dart";
import 'package:stockton/models/member.dart';

@immutable
class NewMessageWithMultipleFilesAction {
  final List<String> fileIdentifiers; // File paths in case of Android, localIdentifier in case of iOS multiselect & path in case of camera image
  final bool isPath;
  const NewMessageWithMultipleFilesAction(this.fileIdentifiers, this.isPath);
}

@immutable
class ChangeAvatarAction {
  final File file;
  final Member member;

  const ChangeAvatarAction({
    @required this.file,
    @required this.member,
  });
}
