import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:stockton/models/channel.dart';
import 'package:stockton/redux/app_selector.dart';
import 'package:stockton/redux/app_state.dart';

part 'main_screen_view_model.g.dart';

abstract class MainScreenViewModel implements Built<MainScreenViewModel, MainScreenViewModelBuilder> {
  bool get hasData;

  @nullable
  ChannelType get channelType;

  MainScreenViewModel._();
  factory MainScreenViewModel([void Function(MainScreenViewModelBuilder) updates]) = _$MainScreenViewModel;

  static bool _hasData(Store<AppState> store) {
    return store.state.member != null && store.state.channelState.selectedChannel != null;
  }

  static MainScreenViewModel fromStore(Store<AppState> store) {
    return MainScreenViewModel((vm) => vm..hasData = _hasData(store)..channelType = getSelectedChannel(store.state)?.type);
  }
}
