import 'package:flutter/material.dart';
import 'package:stockton/mock_data/message_model.dart';
import 'package:stockton/screens/peep_chat_container.dart';
import 'package:stockton/util/theme.dart';
import 'package:stockton/widgets/favorite_contacts.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colorDeepBlack,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: FavoriteContacts(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PeepChatContainer(chat: chats[index]);
              },
              childCount: chats.length,
            ),
          ),
        ],
      ),
    );
  }
}
