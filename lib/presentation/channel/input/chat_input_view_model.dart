import "package:built_value/built_value.dart";
import "package:redux/redux.dart";
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/ui/ui_state_selector.dart';

// ignore: prefer_double_quotes
part 'chat_input_view_model.g.dart';

abstract class ChatInputViewModel
    implements Built<ChatInputViewModel, ChatInputViewModelBuilder> {

  @nullable
  String get inputDraft;

  ChatInputViewModel._();

  factory ChatInputViewModel(
      [void Function(ChatInputViewModelBuilder) updates]) =
  _$ChatInputViewModel;

  static ChatInputViewModel fromStore(Store<AppState> store) {
    return ChatInputViewModel((v) => v
      ..inputDraft = getInputDraftSelectedChannel(store.state));
  }
}
