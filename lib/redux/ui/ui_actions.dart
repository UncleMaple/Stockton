import "package:meta/meta.dart";

class UpdatedChatDraftAction {
  final String text;
  final int groupId;
  final int channelId;

  const UpdatedChatDraftAction({
    @required this.text,
    @required this.groupId,
    @required this.channelId,
  });

  @override
  String toString() {
    return "UpdatedChatDraftAction{text: $text, groupId: $groupId, channelId: $channelId}";
  }
}
