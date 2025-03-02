import 'package:t3_w3/classes/contact.dart';
import 'package:t3_w3/classes/group.dart';
import 'package:t3_w3/classes/user.dart';

class RegularUser extends User {
  List<Contact?> allAddedContacts;
  List<Group?> allJoinedGroups;
  RegularUser(
    super.name,
    super._phoneNumber,
    super._email,
    super._password,
    super._address, {
    required this.allAddedContacts,
    required this.allJoinedGroups,
  });

  void addContact(Contact contact) => allAddedContacts.add(contact);

  void removeContact(String contactId) {
    final contact = searchForContact(contactId);
    contact == null
        ? print('The contact with id $contactId doesn\'t exist')
        : print('The contact ${contact.name} is removed, successfully');
  }

  Contact? searchForContact(String contactId) {
    final targetContact = allAddedContacts.firstWhere(
        (contact) => contact!.contactId == contactId,
        orElse: () => null);
    return targetContact;
  }

  void joinGroup(Group group) {
    if (searchForGroup(group.id) == null) {
      group.addContactToGroup(this);
      allJoinedGroups.add(group);
    } else {
      print('U are already a member of this group');
    }
  }

  Group? searchForGroup(String groupId) {
    final targetGroup = allJoinedGroups.firstWhere(
      (group) => group!.id == groupId,
      orElse: () => null,
    );
    return targetGroup;
  }

  void leaveGroup(String groupId) {
    searchForGroup(groupId) != null
        ? {
            allJoinedGroups.removeWhere((group) => group?.id == groupId),
            print('U\'ve successfully left the group')
          }
        : print('U are not a member of this group');
  }
}
