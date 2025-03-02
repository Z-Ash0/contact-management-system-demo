import 'package:t3_w3/classes/admin.dart';
import 'package:t3_w3/classes/group.dart';
import 'package:t3_w3/classes/contact.dart';
import 'package:t3_w3/classes/message.dart';
import 'package:t3_w3/classes/regular_user.dart';

void main() {
  // Create Users
  RegularUser userFares, userMai;
  Admin adminZyad;
  Contact contactFares, contactMai;

  userFares = RegularUser('Fares', '01001241689', 'faresWOW@gmail.com',
      'password Is 123', 'Mansoura',
      allAddedContacts: [], allJoinedGroups: []);

  userMai = RegularUser(
      'Mai', '01007896554', 'MaiWOW@gmail.com', 'password is not 123', 'tanta',
      allAddedContacts: [], allJoinedGroups: []);

  contactFares = Contact(
      name: 'Farosa', phoneNumber: userFares.phoneNum, contactId: userFares.id);
  contactMai = Contact(
      name: 'Maiiii', phoneNumber: userMai.phoneNum, contactId: userMai.id);

  userFares.addContact(contactMai);
  userMai.addContact(contactFares);

  // Create Admin
  adminZyad = Admin(
    'ZAsh',
    '01005255251',
    'adminZyad@gmail.com',
    'i\'m admin :)',
    'mansoura',
    [userFares, userMai],
    [],
  );

  // Display all users managed by the admin
  print('--- All Users ---\n');
  adminZyad.getAllUsers();

  Group group1 = adminZyad.createGroup('Our Group', userFares);
  Group group2 = adminZyad.createGroup('Our 2nd Group', adminZyad);

  adminZyad.addUserToSpecificGroup(group1.groupId, userMai.id);
  userFares.joinGroup(group2);

  print('--- All Groups ---\n');
  adminZyad.getAllGroups();

  print('------- Fares data ------- \n');
  print(userFares.allJoinedGroups.map((group) => '${group!.name}, '));
  userFares.allAddedContacts
      .forEach((contact) => contact?.displayContactInfo());

  userMai.leaveGroup(group2.groupId);

  Message message =
      Message(msgType: MessageType.text, status: MessageStatus.unseen);

  message.sendMessage(contactFares, contactMai, 'Deliver the task :(',
      msgType: MessageType.text, msgStatus: MessageStatus.deliverd);

  print('Is the message seen? ${message.isSeen()} \n');

  adminZyad.deleteUserAccount(userMai.id);
  adminZyad.deleteGroup(group1.id);

  print('--- Updated Users ---');
  adminZyad.getAllUsers();

  print('--- Updated Groups ---');
  adminZyad.getAllGroups();
}
