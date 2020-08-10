import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";

import "package:redux/redux.dart";
import 'package:stockton/models/member.dart';
import 'package:stockton/models/message.dart';
import 'package:stockton/redux/app_selector.dart';
import 'package:stockton/redux/app_state.dart';

// ignore: prefer_double_quotes
part 'messages_list_view_model.g.dart';

abstract class MessagesListViewModel
    implements Built<MessagesListViewModel, MessagesListViewModelBuilder> {
  @nullable
  Member get currentMember;

  BuiltList<Message> get messages;

  bool get memberIsMe;

  BuiltMap<String, Member> get authors;

  MessagesListViewModel._();

  factory MessagesListViewModel(
      [void Function(MessagesListViewModelBuilder) updates]) =
  _$MessagesListViewModel;

  static MessagesListViewModel fromStore(Store<AppState> store) {
    return MessagesListViewModel((m) => m
      ..messages = store.state.messagesOnScreen.toBuilder()
      ..currentMember = store.state.member?.toBuilder()
      ..authors = MapBuilder(
          store.state.groupMembers.asMap().map((k, v) => MapEntry(v.id, v)))
      ..memberIsMe = getSelectedChannel(store.state)?.members
          ?.any((u) => u.id == store.state.member.id));
  }
}
