import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";
import "package:redux/redux.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/redux/app_selector.dart';
import 'package:stockton/redux/app_state.dart';

// ignore: prefer_double_quotes
part 'topic_details_view_model.g.dart';

abstract class TopicDetailsViewModel
    implements Built<TopicDetailsViewModel, TopicDetailsViewModelBuilder> {
  String get name;

  String get description;

  ChannelVisibility get visibility;

  BuiltList<Member> get members;

  int get groupId;

  Channel get channel;

  int get memberId;

  TopicDetailsViewModel._();

  factory TopicDetailsViewModel(
      [void Function(TopicDetailsViewModelBuilder) updates]) =
  _$TopicDetailsViewModel;

  static TopicDetailsViewModel fromStore(Store<AppState> store) {
    final channel = getSelectedChannel(store.state);
    final members = store.state.groupMembers
        .where((member) => channel.members.any((u) => u.id == member.id));

    return TopicDetailsViewModel((t) => t
      ..name = channel.name
      ..visibility = channel.visibility
      ..description = channel.description ?? ""
      ..members.addAll(members)
      ..groupId = store.state.selectedGroupId
      ..channel = channel.toBuilder()
      ..memberId = store.state.member.id);
  }
}
