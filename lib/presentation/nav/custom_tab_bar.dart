import 'package:flutter/material.dart';
import 'package:stockton/util/colors.dart';
import 'package:stockton/util/theme.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isTopIndicator;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isTopIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        border: isTopIndicator
            ? Border(
                top: BorderSide(
                  color: AppTheme.colorClassicBlue,
                  width: 3.0,
                ),
              )
            : Border(
                bottom: BorderSide(
                  color: AppTheme.colorClassicBlue,
                  width: 2.0,
                ),
              ),
      ),
      labelColor: AppTheme.colorClassicBlue,
      unselectedLabelColor: whiteDark,
      labelPadding: EdgeInsets.all(0),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(i, _individualTab(i == icons.length - 1, e)))
          .values
          .toList(),
    );
  }
}

Widget _individualTab(bool isLast, IconData icon) {
  return Container(
    width: double.infinity,
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(), flex: 1),
          Tab(
            icon: Icon(icon,size: 30.0,),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  color: isLast ? AppTheme.colorDeepBlack : AppTheme.colorDarkWhite,
                  // color: Colors.yellow,
                  width: 0,
                  thickness: 2.0,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
