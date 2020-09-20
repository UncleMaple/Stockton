import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stockton/util/theme.dart';

class MemberAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool isActive;
  final bool hasBorder;

  const MemberAvatar({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
    this.size = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: size,
          backgroundColor: AppTheme.colorClassicBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : size,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      color: AppTheme.colorClassicBlue,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.white)),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
