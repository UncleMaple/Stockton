import 'package:meta/meta.dart';
import 'package:stockton/models/group.dart';

class ConnectToDataSource {
  @override
  String toString() {
    // TODO: implement toString
    return "ConnectToDataSource{}";
  }
}

@immutable
class OnGroupsLoaded {
  final List<Group> groups;

  const OnGroupsLoaded(this.groups);

  @override
  String toString() {
    // TODO: implement toString
    return "OnGroupsLoaded{groups: $groups}";
  }
}

@immutable
class SelectGroup {
  final int groupId;

  const SelectGroup(this.groupId);

  @override
  String toString() {
    return "SelectGroup{groupId: $groupId}";
  }
}
