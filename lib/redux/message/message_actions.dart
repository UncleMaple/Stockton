import "package:meta/meta.dart";
import 'package:stockton/models/message.dart';

@immutable
class SendMessage {
  final String message;

  const SendMessage(
      this.message,
      );

  @override
  String toString() {
    return "SendMessage{message: $message}";
  }
}

@immutable
class UpdateAllMessages {
  final List<Message> data;

  const UpdateAllMessages(this.data);
}

@immutable
class DeleteMessage {
  final int messageId;

  const DeleteMessage(this.messageId);
}

@immutable
class EmojiReaction {
  final String emoji;
  final int messageId;

  const EmojiReaction(this.messageId, this.emoji);
}

@immutable
class RemoveEmojiReaction {
  final int messageId;

  const RemoveEmojiReaction(this.messageId);
}
