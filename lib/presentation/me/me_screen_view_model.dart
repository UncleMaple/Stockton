import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/redux/app_state.dart';

part 'me_screen_view_model.g.dart';

abstract class MeScreenViewModel implements Built<MeScreenViewModel, MeScreenViewModelBuilder> {
  Member get currentMember;

  MeScreenViewModel._();
  factory MeScreenViewModel([void Function(MeScreenViewModelBuilder) updates]) = _$MeScreenViewModel;

  static MeScreenViewModel fromStore(Store<AppState> store){
      return MeScreenViewModel((m) => m..currentMember = store.state.member?.toBuilder());
  }
}
