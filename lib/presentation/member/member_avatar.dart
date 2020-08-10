import "package:flutter/material.dart";
import 'package:stockton/models/member.dart';
import 'package:stockton/util/theme.dart';
import "package:transparent_image/transparent_image.dart";

class MemberAvatar extends StatelessWidget {
  const MemberAvatar({
    @required this.member,
    this.size = AppTheme.avatarSize,
  });

  // member can be null
  final Member member;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (member?.avatar == null) {
      return Image.asset(
        "assets/graphics/avatar_no_picture.png",
        height: size,
        width: size,
        fit: BoxFit.contain,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: FadeInImage.memoryNetwork(
        image: member.avatar,
        height: size,
        width: size,
        fit: BoxFit.fitHeight,
        placeholder: kTransparentImage,
      ),
    );
  }
}
