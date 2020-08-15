import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/presentation/member/rsvp_icon.dart';
import 'package:stockton/presentation/member/selected_item.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';
import "package:transparent_image/transparent_image.dart";

class MemberItem extends StatelessWidget {
  const MemberItem({
    Key key,
    @required Member member,
    bool selected = false,
    Function selectionHandler,
    RSVP rsvp,
    bool isYou = false,
    bool isHost = false,
  })  : _member = member,
        _selected = selected,
        _selectionHandler = selectionHandler,
        _rsvp = rsvp,
        _isYou = isYou,
        _isHost = isHost,
        super(key: key);

  final Member _member;
  final bool _selected;
  final Function _selectionHandler;
  final RSVP _rsvp;
  final bool _isYou;
  final bool _isHost;

  @override
  Widget build(BuildContext context) {
    final placeholderImage = Image.asset(
      "assets/graphics/avatar_no_picture.png",
      height: AppTheme.avatarSize,
      width: AppTheme.avatarSize,
    );

    final memberName = _isYou ? StocktonLocalizations.of(context).you : _member.nickname;
    final memberText = _isHost
        ? "$memberName · ${StocktonLocalizations.of(context).eventHost}"
        : memberName;

    Widget _buildImage() {
      if (_member.avatar == null) {
        return placeholderImage;
      }

      return Container(
          child: FadeInImage.memoryNetwork(
            image: _member.avatar,
            height: AppTheme.avatarSize,
            width: AppTheme.avatarSize,
            fit: BoxFit.contain,
            placeholder: kTransparentImage,
          ));
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
          key: Key("${_member.id}.InkWell"),
          onTap: () {
            if (_selectionHandler != null) {
              _selectionHandler(_member);
            } else {
              _openDetails(context, _member);
            }
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 63,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppTheme.appMargin,
                        right: AppTheme.appMargin,
                      ),
                      child: _buildImage(),
                    ),
                    Expanded(
                      child: Text(
                        memberText,
                        style: AppTheme.messageAuthorNameTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Visibility(
                      visible: _selectionHandler != null,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(right: AppTheme.appMargin),
                        child: SelectedItem(
                          selected: _selected,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _rsvp != null,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(right: AppTheme.appMargin),
                        child: RsvpIcon(
                          rsvp: _rsvp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppTheme.appMargin,
                  right: AppTheme.appMargin,
                ),
                child: Container(
                  height: 1,
                  color: AppTheme.colorShadow,
                ),
              ),
            ],
          )),
    );
  }

  void _openDetails(context, Member member) {
    Navigator.of(context).pushNamed(Routes.member, arguments: member.id);
  }
}
