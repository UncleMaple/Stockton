import "package:redux/redux.dart";
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/ui/ui_actions.dart';
import 'package:stockton/redux/ui/ui_state_selector.dart';
import 'package:stockton/util/logger.dart';

final uiReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, UpdatedChatDraftAction>(_onUpdatedChatDraft),
];

AppState _onUpdatedChatDraft(AppState state, UpdatedChatDraftAction action) {
  Logger.d(action.toString());
  final out = state.rebuild(
        (s) => s
      ..uiState.update(
            (u) => updateInputDraft(
          state: u,
          groupId: action.groupId,
          channelId: action.channelId,
          value: action.text,
        ),
      ),
  );
  Logger.d(out.uiState.toString());
  return out;
}
