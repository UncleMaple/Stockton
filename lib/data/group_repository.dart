import 'package:stockton/models/group.dart';

class GroupRepository {
  static const String NAME = "name";
  static const String ABBREVIATION = "abbreviation";
  static const String IMAGE = "image";
  static const String COLOR = "color";
  static const String MEMBERS = "members";

  const GroupRepository();

  Future<Group> getGroup(String id) async {
    // 从服务器根据id获取group
    return Group();
  }

  Stream<List<Group>> getGroupStream(memberId) {
    // 根据memberId 获取他加过的所有群
    // !!! 未实现
    return null;
  }
}
