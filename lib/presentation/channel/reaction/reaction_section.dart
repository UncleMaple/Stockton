import "package:flutter/material.dart";
import 'package:stockton/models/member.dart';
import 'package:stockton/models/message.dart';
import 'package:stockton/presentation/channel/reaction/reaction.dart';
import 'package:stockton/presentation/channel/reaction/reaction_button.dart';
import 'package:stockton/util/routes.dart';

class ReactionSection extends StatelessWidget {
  const ReactionSection({
    Key key,
    @required Message message,
    @required Member currentMember,
    @required bool memberIsMe,
  })  : _message = message,
        _currentMember = currentMember,
        _memberIsMe = memberIsMe,
        super(key: key);

  final Message _message;
  final Member _currentMember;
  final bool _memberIsMe;

  @override
  Widget build(BuildContext context) {
    final memberEmoji = _message.reactions[_currentMember.id];

    final list = <Widget>[];

    _message.reactionsCount().forEach((emoji, count) {
      final isMemberEmoji = memberEmoji?.emoji == emoji;
      list.add(Reaction(
        emoji: emoji,
        count: count,
        isMemberEmoji: isMemberEmoji,
        messageId: _message.id,
      ));
    });

    if (list.isNotEmpty &&
        _currentMember.id != _message.authorId &&
        !_message.reactions.containsKey(_currentMember.id) &&
        _memberIsMe) {
      list.add(ReactionButton(_message)); // 表情
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onLongPress: () {
          Navigator.of(context).pushNamed(
            Routes.reaction,
            arguments: _message.reactions,
          );
        },
        // Wrap takes care of showing the each reaction one after the other
        // and when it runs out of space, will go to the next line.
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          direction: Axis.horizontal,
          children: list,
        ),
      ),
    );
  }
}
