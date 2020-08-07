import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:stockton/models/channel.dart';
import 'package:stockton/redux/app_selector.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/date_formatting.dart';

part 'home_app_bar_view_model.g.dart';

abstract class HomeAppBarViewModel
    implements Built<HomeAppBarViewModel, HomeAppBarViewModelBuilder> {
  bool get hasUpdatedChannelsInGroup;

  String get title;

  bool get memberOfChannel;

  bool get isEvent;

  String get eventDate;

  HomeAppBarViewModel._();

  factory HomeAppBarViewModel(
          [void Function(HomeAppBarViewModelBuilder) updates]) =
      _$HomeAppBarViewModel;

  static Function(Store<AppState> store) fromStore(context) {
    return (Store<AppState> store) {
      final channel = getSelectedChannel(store.state);
      final groupId = store.state.selectedGroupId;
      final channels = store.state.groups[groupId].channels.values.toList();
      final hasGroupUpdates =
          channels.any((c) => (c != channel && c.hasUpdates));

      final isMemberOfChannel =
          channel.members.any((m) => m.id == store.state.member.id);

      return HomeAppBarViewModel((vm) {
        return vm
          ..title = channel.name
          ..memberOfChannel = isMemberOfChannel
          ..hasUpdatedChannelsInGroup = hasGroupUpdates
          ..isEvent = channel.type == ChannelType.EVENT
          ..eventDate = _formatDate(context, channel);
      });
    };
  }

  static String _formatDate(context, Channel channel) {
    if (channel.startDate == null) {
      return "";
    }
    try {
      if (channel.hasStartTime) {
        return "${formatDate(context, channel.startDate)} "
            "${StocktonLocalizations.of(context).at} "
            "${formatTime(context, channel.startDate)}";
      } else {
        return formatDate(context, channel.startDate);
      }
    } catch (error) {
      return "";
    }
  }
}
