import 'dart:math';

import 'package:t3_w3/classes/user.dart';

class Group {
  String name;
  List<User?> joinedUsers;
  String groupId;
  final User _groupAdmin;
  Group(this.name, this.joinedUsers, this._groupAdmin)
      : groupId = Random().nextInt(200).toString();

  get groupName => name;
  get groupUsers => joinedUsers;
  get groupAdmin => _groupAdmin;
  get id => groupId;

  void addContactToGroup(User user) {
    joinedUsers.add(user);
    print('User ${user.name} is added to the group');
  }

  void removeContactFromGroup(String userId) {
    User? targetUser = joinedUsers.firstWhere((user) => user!.id == userId,
        orElse: () => null);
    targetUser == null
        ? print('The id $userId doesn\'t exist')
        : print('User ${targetUser.name} is removed from the group');
  }

  void showGroupMembers() {
    joinedUsers == []
        ? print('There\'s no group members')
        : joinedUsers.map((user) => print(
            'The user with id ${user!.id},\nName is: ${user.name} \n,Phone number is: ${user.phoneNum}'));
  }
}
