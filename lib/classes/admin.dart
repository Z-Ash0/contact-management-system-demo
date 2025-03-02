import 'package:t3_w3/classes/group.dart';
import 'package:t3_w3/classes/user.dart';

class Admin extends User {
  Admin(
    super.name,
    super.phoneNumber,
    super.email,
    super.password,
    super.address,
    this.allUsersData,
    this.allGroupsData,
  );
  List<User?> allUsersData = [];
  List<Group?> allGroupsData = []; //! Don't forget to use group

  void deleteGroup(String groupId) {
    allGroupsData.isNotEmpty
        ? {
            allGroupsData.removeWhere((group) => group!.id == groupId),
            print('Group with ID $groupId is deleted successfully')
          }
        : print('There\'s no groups');
  }

  void deleteUserAccount(String userId) {
    allUsersData.isNotEmpty
        ? {
            allUsersData.removeWhere((user) => user!.id == userId),
            print('User with Id $userId is deleted successfully')
          }
        : print('There\'s no users');
  }

  User? findUser(String userID) {
    return allUsersData.firstWhere((user) => user!.id == userID,
        orElse: () => null);
  }

  Group createGroup(String groupName, User admin) {
    final newGroup = Group(name, [], admin);
    allGroupsData.add(newGroup);
    print('The $groupName is created successfully');
    return newGroup;
  }

  void addUserToSpecificGroup(String groupId, String userId) {
    final wantedUser = allUsersData.firstWhere((user) => userId == user!.id);
    final wantedGroup =
        allGroupsData.firstWhere((group) => group!.id == groupId);
    wantedGroup == null || wantedUser == null
        ? print('The user or group is not found')
        : wantedGroup.addContactToGroup(wantedUser);
  }

  void getAllGroups() {
    allGroupsData.isNotEmpty
        ? allGroupsData.forEach((group) => print(group!.name.toString()))
        : print('There are no groups to show');
  }

  void getAllUsers() {
    allUsersData.isNotEmpty
        ? allUsersData.forEach((user) => print(user!.name.toString()))
        : print('There are no users to show');
  }
}
