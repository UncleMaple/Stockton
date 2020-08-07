import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/presentation/home/home_app_bar_view_model.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/util/theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ValueNotifier<bool> sideOpenController;

  const HomeAppBar({
    @required this.scaffoldKey,
    @required this.sideOpenController,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeAppBarViewModel>(
      distinct: true,
      converter: HomeAppBarViewModel.fromStore(context),
      builder: (context, vm) => _buildAppBar(context, vm),
    );
  }

  Widget _buildAppBar(BuildContext context, HomeAppBarViewModel vm) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
          color:  Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        height: AppTheme.appBarSize,
        child: Row(
          children: <Widget>[
            _hamburger(vm),
            _title(vm),
            _options(vm),
          ],
        ),
      ),
    );
  }

  Visibility _options(HomeAppBarViewModel vm) {
    return Visibility(
        visible: vm.memberOfChannel,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              sideOpenController.value = true;
            },
            child: Container(
              width: AppTheme.appBarSize,
              height: AppTheme.appBarSize,
              child: Center(
                child: Image.asset(
                  "assets/graphics/menu_more_icon.png",
                  width: 28,
                  height: 28,
                ),
              ),
            ),
          ),
        ));
  }

  Widget _title(HomeAppBarViewModel vm) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            vm.title,
            style: AppTheme.channelTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          _eventDetails(vm),
        ],
      ),
    );
  }

  Widget _eventDetails(HomeAppBarViewModel vm) {
    if (vm.isEvent) {
      return Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Image.asset(
              "assets/graphics/channel/header_calendar_icon.png",
              width: 14,
              height: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              vm.eventDate,
              style: AppTheme.channelSubTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _hamburger(HomeAppBarViewModel vm) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          scaffoldKey.currentState.openDrawer();
        },
        child: Container(
          width: AppTheme.appBarSize,
          height: AppTheme.appBarSize,
          child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Image.asset(
                  "assets/graphics/menu_icon.png",
                  width: 25,
                  height: 25,
                ),
                Visibility(
                  visible: vm.hasUpdatedChannelsInGroup,
                  child: Positioned(
                    top: -3,
                    right: -5,
                    height: 12,
                    width: 12,
                    child: Image.asset(
                      "assets/graphics/updates_indicator_white.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppTheme.appBarSize);
}
