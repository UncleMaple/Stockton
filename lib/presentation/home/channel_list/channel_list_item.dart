import "package:flutter/widgets.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/stockton_localization.dart';

abstract class ChannelListItem {}

// ChannelListHeadingItem

class ChannelListHeadingItem implements ChannelListItem {
  final String text;
  final ChannelLocalizedKey key;
  final ChannelListHeadingItemType type;

  ChannelListHeadingItem(
      {this.text,
        this.key = ChannelLocalizedKey.NONE,
        this.type = ChannelListHeadingItemType.SECTION});
}

enum ChannelListHeadingItemType { SECTION, H1, H2 }

// ChannelListActionItem

class ChannelListActionItem implements ChannelListItem {
  final ChannelLocalizedKey title;
  final Function buttonAction;

  ChannelListActionItem(this.title, this.buttonAction);
}

// ChannelListChannelItem

class ChannelListChannelItem implements ChannelListItem {
  final Channel channel;
  final String title;
  final bool userIsMember;
  final bool isPublic;
  final bool isSelected;

  ChannelListChannelItem(this.channel, this.title, this.userIsMember,
      this.isPublic, this.isSelected);
}

// This is needed since we currently need a BuildContext to localize.
enum ChannelLocalizedKey {
  TOPICS,
  JOINED,
  PENDING,
  EVENTS,
  UPCOMING,
  PREVIOUS,
  UNREAD,
  NONE,
}

class ChannelItemTitleKeyHelper {
  static String stringOf(ChannelLocalizedKey key, BuildContext context) {
    switch (key) {
      case ChannelLocalizedKey.TOPICS:
        return StocktonLocalizations.of(context).channelTitle;
      case ChannelLocalizedKey.PENDING:
        return StocktonLocalizations.of(context).channelListPending;
      case ChannelLocalizedKey.JOINED:
        return StocktonLocalizations.of(context).channelListJoined;
      case ChannelLocalizedKey.EVENTS:
        return StocktonLocalizations.of(context).channelListEvents;
      case ChannelLocalizedKey.UPCOMING:
        return StocktonLocalizations.of(context).channelListUpcoming;
      case ChannelLocalizedKey.PREVIOUS:
        return StocktonLocalizations.of(context).channelListPrevious;
      case ChannelLocalizedKey.UNREAD:
        return StocktonLocalizations.of(context).channelListUnread;
      case ChannelLocalizedKey.NONE:
        return "";
    }
    return "";
  }
}
