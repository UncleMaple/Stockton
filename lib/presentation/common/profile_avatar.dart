import 'package:flutter/material.dart';
import 'package:stockton/presentation/member/member_avatar.dart';

class ProfileAvatar extends StatelessWidget {
  final String imgUrl;
  final Widget picIconButton;

  const ProfileAvatar({
    Key key,
    @required this.imgUrl,
    this.picIconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: _Style.avatarSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(),
              MemberAvatar(
                imageUrl: imgUrl,
                size: 30.0,
              ),
              Positioned(
                bottom: 12.0,
                right: 12.0,
                child: AnimatedSwitcher(
                  child: picIconButton ?? SizedBox.shrink(),
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Style {
  static const double avatarSize = 200.0;
}
