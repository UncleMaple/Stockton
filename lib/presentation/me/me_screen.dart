import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/presentation/common/profile_avatar.dart';
import 'package:stockton/presentation/me/me_screen_view_model.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/util/theme.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MeScreenViewModel>(
      builder: (context, vm) => Container(
        color: AppTheme.colorDeepBlack,
        child: Column(
          children: [
            // 头部 包含头像 昵称 签名
            _MeHeader(vm: vm),
            Divider(
              color: AppTheme.colorShallowBlack,
              height: 0,
              thickness: 1,
            ),
            _MeItems(),
          ],
        ),
      ),
      converter: MeScreenViewModel.fromStore,
    );
  }
}

class _MeHeader extends StatelessWidget {
  final MeScreenViewModel vm;

  const _MeHeader({
    Key key,
    @required this.vm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: CachedNetworkImageProvider(
                "https://i.loli.net/2020/09/05/JdlgeqIQCLWDGK8.jpg" ??
                    vm.currentMember.avatar),
          ),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vm.currentMember.nickname ?? "no name",
                style: TextStyle(
                  color: AppTheme.colorBrightWhite,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                vm.currentMember.memo ?? "null memo",
                style: TextStyle(color: AppTheme.colorDarkWhite),
              ),
            ],
          )
        ],
      ),
    );
  }
}

var _item1 = {
  "title": "Language",
  "icon": Icons.language,
  "tip": "Switch language"
};
var _item2 = {
  "title": "Theme",
  "icon": Icons.brightness_6,
  "tip": "Change color theme"
};
var _item3 = {
  "title": "Logout",
  "icon": Icons.nature_people,
  "tip": "Quit for a while"
};
List _items = [_item1, _item2, _item3];

class _MeItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      // color: Colors.green,
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _items[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    item["icon"],
                    color: AppTheme.colorDarkWhite,
                    size: 18.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppTheme.colorBrightWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      item["tip"],
                      style: TextStyle(color: AppTheme.colorDarkWhite),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
