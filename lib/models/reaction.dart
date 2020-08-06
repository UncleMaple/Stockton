import 'package:built_value/built_value.dart';

part 'reaction.g.dart';

abstract class Reaction implements Built<Reaction, ReactionBuilder> {
  String get emoji;

  String get memberId;

  String get memberName;

  DateTime get timestamp;

  Reaction._();
  factory Reaction([void Function(ReactionBuilder) updates]) = _$Reaction;
}
