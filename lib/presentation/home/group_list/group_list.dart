import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/models/group.dart';
import 'package:stockton/presentation/common/platform_alerts.dart';
import 'package:stockton/presentation/home/group_list/group_list_view_model.dart';
import 'package:stockton/presentation/home/stockton_drawer.dart';
import 'package:stockton/redux/app_actions.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/util/hex_color.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';

class GroupList extends StatefulWidget {
  final Function(DrawerState) stateChangeCallback;

  const GroupList(this.stateChangeCallback);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  bool _calendarSelected = false;

  // 侧边栏events 日历
  _buildFirstSection(BuildContext context) {
    return Container(
      height: _Style.firstSectionHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                ...buildSelectionHighlight(_calendarSelected, Colors.white),
                _selectableListItem(
                    icon: Image.asset("assets/graphics/drawer/events.png"),
                    isSelected: _calendarSelected,
                    action: () {
                      widget.stateChangeCallback(DrawerState.CALENDAR);
                      setState(() {
                        _calendarSelected = true;
                      });
                    }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: _Style.padding,
            ),
          ),
          Container(
            color: AppTheme.colorDarkGreen,
            height: _Style.separatorHeight,
            width: _Style.separatorWidth,
          ),
        ],
      ),
    );
  }

  // 更多功能
  _buildThirdSection(BuildContext context) {
    return Container(
      height: _Style.thirdSectionHeight,
      child: Column(
        children: [
          _Style.defaultPadding,
          _GroupSettingsButton(
              Image.asset("assets/graphics/drawer/create_topic.png"), () {
            showSoonAlert(context: context);
          }),
        ],
      ),
    );
  }

  // 底部 设置按钮 和 用户按钮
  _buildFourthSection(BuildContext context) {
    return Container(
      height: _Style.fourthSectionHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _GroupSettingsButton(
            Image.asset("assets/graphics/drawer/settings.png"),
                () {
              Navigator.pushNamed(context, Routes.settings);
            },
          ),
          _Style.defaultPadding,
          _GroupSettingsButton(
            Image.asset("assets/graphics/drawer/account.png"),
                () {
              _openMemberAccount(context);
            },
          ),
          _Style.defaultPadding
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GroupListViewModel>(
      converter: GroupListViewModel.fromStore,
      distinct: true,
      builder: (context, viewModel) {
        final secondSectionHeight = viewModel.groups.length * _Style.itemHeight;
        final statusBarHeight = MediaQuery
            .of(context)
            .padding
            .top;
        final topPadding = MediaQuery
            .of(context)
            .size
            .height -
            (_Style.totalStaticSectionHeight +
                secondSectionHeight +
                statusBarHeight);

        final items = [
          _buildFirstSection(context), // 日程
          ...viewModel.groups.toList(), // 事项
          _buildThirdSection(context), // 更多
          Padding(
            padding: EdgeInsets.only(
                top: topPadding < 100 ? _Style.padding * 2 : topPadding),
          ),
          _buildFourthSection(context) // 设置、个人信息
        ];

        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: _Style.listWidth,
          color: AppTheme.colorDarkBlue.withOpacity(0.3),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              if (item is Group) {
                return _GroupListItem(
                  item,
                  item.id == viewModel.selectedGroupId && !_calendarSelected,
                  viewModel.updatedGroups.contains(item.id),
                      () {
                    widget.stateChangeCallback(DrawerState.CHANNEL);
                    setState(() {
                      _calendarSelected = false;
                    });
                  },
                );
              } else {
                return item;
              }
            },
          ),
        );
      },
    );
  }

  // ??? 路由切换传参数
  void _openMemberAccount(BuildContext context) {
    final memberId = StoreProvider
        .of<AppState>(context)
        .state
        .member
        .id;
    Navigator.of(context).pushNamed(Routes.member, arguments: memberId);
  }
}

class _GroupListItem extends StatelessWidget {
  final Group _group;
  final bool _selected;
  final bool _hasUpdates;
  final Function _selectionCallback;

  const _GroupListItem(group,
      selected,
      hasUpdates,
      selectionCallback, {
        Key key,
      })
      : _group = group,
        _selected = selected,
        _hasUpdates = hasUpdates,
        _selectionCallback = selectionCallback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _Style.itemHeight,
      child: Padding(
        padding: const EdgeInsets.only(
          top: _Style.padding,
          right: _Style.padding,
        ),
        child: _GroupButton (
        _group,
            (groupId) {
          _selectionCallback();
          _selectGroup(context, groupId);
        },
        _selected,
        _hasUpdates,
      ),
    ));
  }

  void _selectGroup(BuildContext context, int groupId) {
    StoreProvider.of<AppState>(context).dispatch(SelectGroup(groupId));
  }
}

class _GroupButton extends StatelessWidget {
  final Group group;
  final Function(int) onPressedCircle;
  final bool isSelected;
  final bool hasUpdates;

  const _GroupButton(this.group,
      this.onPressedCircle,
      this.isSelected,
      this.hasUpdates, {
        Key key,
      })
      : assert(group != null),
        assert(onPressedCircle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _circleColor = HexColor(group.hexColor);
    final _groupText = group.abbreviation.substring(0, 2).toUpperCase();

    return Container(
      child: Row(
        children: [
          ...buildSelectionHighlight(isSelected, _circleColor),
          _selectableListItem(
            color: _circleColor,
            text: _groupText,
            action: () {
              onPressedCircle(group.id);
            },
            updateIndicatorVisible: hasUpdates,
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }
}

class _GroupSettingsButton extends StatelessWidget {
  final Image image;
  final Function onPressed;

  const _GroupSettingsButton(this.image,
      this.onPressed, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _Style.circleButtonWidth,
      height: _Style.circleButtonWidth,
      child: FittedBox(
        fit: BoxFit.cover,
        child: FlatButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: image,
        ),
      ),
    );
  }
}

// 可选项展示
_selectableListItem({
  Color color = Colors.white,
  String text = "",
  Image icon,
  Function action,
  bool updateIndicatorVisible = false,
  bool isSelected = false,
}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 100),
    width: _Style.circleButtonWidth,
    height: _Style.circleButtonWidth,
    decoration: BoxDecoration(
      color: color,
      // 变方或变圆
      borderRadius: BorderRadius.all(Radius.circular(isSelected ? 8.0 : 22.0)),
    ),
    child: Stack(
      overflow: Overflow.visible,
      children: [
        InkWell(
          child: Center(
            child: Container(
              alignment: Alignment(0, 0.2),
              width: _Style.circleButtonWidth,
              height: _Style.circleButtonWidth,
              child: icon == null
                  ? Text(text, style: AppTheme.circleMenuAbbreviationText)
                  : icon,
            ),
          ),
          onTap: action,
        ),
        Visibility(
          // 未读显示红点
          visible: updateIndicatorVisible,
          child: Positioned(
            top: -2,
            right: -2,
            height: _Style.circleUnreadIndicatorWidth,
            width: _Style.circleUnreadIndicatorWidth,
            child: Image.asset(
              "assets/graphics/update_indicator_darkgreen.png",
            ),
          ),
        )
      ],
    ),
  );
}

// 选中后，在一侧有半个方形白色小块
List<Widget> buildSelectionHighlight(isSelected, circleColor) {
  final List<Widget> widgets = [];
  if (isSelected) {
    final highlight = ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(_Style.circleHighlightBorderRadius),
        bottomRight: Radius.circular(_Style.circleHighlightBorderRadius),
      ),
      child: Container(
        width: _Style.circleHighlightWidth,
        height: _Style.circleButtonWidth,
        color: circleColor,
      ),
    );
    widgets.add(highlight);
  }

  final sizedBoxSpace = SizedBox(
    width: (isSelected ? 11 : 15),
  );

  widgets.add(sizedBoxSpace);
  return widgets;
}

class _Style {
  static const listWidth = 72.0;
  static const circleButtonWidth = 44.0;

  static const circleHighlightWidth = 4.0;
  static const circleHighlightBorderRadius = 10.0;
  static const circleUnreadIndicatorWidth = 14.0;

  static const separatorHeight = 2.0;
  static const separatorWidth = 48.0;
  static const padding = 8.0;
  static const defaultPadding = Padding(padding: EdgeInsets.only(top: padding));

  static const itemHeight = 52.0;
  static const firstSectionHeight = 100.0;
  static const thirdSectionHeight = 60.0;
  static const fourthSectionHeight = 180.0;
  static const totalStaticSectionHeight =
  340.0; // Sum of all sections without itemHeight
}
