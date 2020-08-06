import 'package:stockton/models/channel.dart';
import 'package:stockton/redux/app_state.dart';

Channel getSelectedChannel(AppState state) {
  if (state.selectedGroupId == null) return null;
  if (state.channelState.selectedChannel == null) return null;
  return state.groups[state.selectedGroupId]
      .channels[state.channelState.selectedChannel];
}
