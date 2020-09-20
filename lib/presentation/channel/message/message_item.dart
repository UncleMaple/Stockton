import "dart:io";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:stockton/models/member.dart';
import 'package:stockton/models/message.dart';
import 'package:stockton/presentation/channel/message/media/MediaMessage.dart';
import 'package:stockton/presentation/channel/message/message_body.dart';
import 'package:stockton/presentation/channel/message/message_timestamp.dart';
import 'package:stockton/presentation/channel/reaction/emoji_picker.dart';
import 'package:stockton/presentation/channel/reaction/reaction_section.dart';
import 'package:stockton/presentation/member/member_avatar.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';
import "package:transparent_image/transparent_image.dart";

class MessageItem extends StatelessWidget {
  const MessageItem({
    @required Message message,
    @required bool memberIsMe,
    @required Member currentMember,
    @required Member author,
    Key key,
  })  : _message = message,
        _currentMember = currentMember,
        _memberIsMe = memberIsMe,
        _author = author,
        assert(message != null),
        assert(currentMember != null),
        super(key: key);

  final Message _message;
  final Member _currentMember;
  final bool _memberIsMe;

  // _author can be null if the author was deleted
  // see: https://github.com/janoodleFTW/flutter-app/issues/222
  final Member _author;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Column(
          children: <Widget>[
            SizedBox(height: AppTheme.appMargin),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildAvatar(context),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _authorName(context),
                          MessageTimestamp(
                            message: _message,
                            currentMember: _currentMember,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      _buildBody(),
                      ReactionSection(
                        message: _message,
                        currentMember: _currentMember,
                        memberIsMe: _memberIsMe,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppTheme.appMargin)
              ],
            ),
            SizedBox(height: AppTheme.appMargin),
          ],
        ),
        onTap: () {
          // On iOS, taping on the chat section dismisses keyboard
          if (Platform.isIOS) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        onLongPress: () {
          if (_currentMember.id != _author?.id &&
              !_message.reactions.containsKey(_currentMember.id) &&
              _memberIsMe) {
            showEmojiPicker(context, _message);
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_message.messageType) {
      case MessageType.MEDIA:
        return MessageMedia(_message);
        break;
      case MessageType.SYSTEM:
      case MessageType.MEMBER:
      case MessageType.RSVP:
      default:
        return MessageBody(
          message: _message,
        );
        break;
    }
  }

  Widget _buildAvatar(context) {
    return InkWell(
      onTap: () {
        if (_author != null) {
          Navigator.of(context).pushNamed(Routes.member, arguments: _author.id);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppTheme.appMargin,
          right: AppTheme.appMargin,
        ),
        child: MemberAvatar(
          imageUrl: _author.avatar,
        ),
      ),
    );
  }

  Widget _authorName(context) {
    return Flexible(
      child: InkWell(
        onTap: () {
          if (_author != null) {
            Navigator.of(context)
                .pushNamed(Routes.member, arguments: _author.id);
          }
        },
        child: Text(
          _author?.nickname ?? StocktonLocalizations.of(context).deletedMember,
          overflow: TextOverflow.ellipsis,
          style: AppTheme.messageAuthorNameTextStyle,
        ),
      ),
    );
  }
}

class PictureInMessage extends StatelessWidget {
  final String url;

  const PictureInMessage(this.url);

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return SizedBox.shrink();
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.image,
                arguments: url,
              );
            },
            child: Stack(
              children: <Widget>[
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
                Center(
                  child: Hero(
                    tag: url,
                    child: FadeInImage.memoryNetwork(
                      image: url,
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
