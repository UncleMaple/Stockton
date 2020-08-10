import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/channel/channel_actions.dart';
import 'package:stockton/stockton_localization.dart';

class JoinChannel extends StatelessWidget {
  final int _groupId;
  final Channel _channel;
  final Member _member;

  const JoinChannel(this._groupId, this._channel, this._member);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 40.0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                            StocktonLocalizations.of(context).channelJoinMessage),
                      ),
                      Container(
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text(StocktonLocalizations.of(context).channelJoin),
                            onPressed: () {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(JoinChannelAction(groupId: _groupId, channel: _channel, member: _member));
                            },
                          ))
                    ],
                  )),
            ],
          ),
        ));
  }
}
