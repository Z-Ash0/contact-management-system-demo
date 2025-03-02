class Contact {
  String name;
  String phoneNumber;
  String contactId;
  Contact(
      {required this.name, required this.phoneNumber, required this.contactId});

  set setName(String name) => this.name = name;
  set setPhoneNum(String phoneNumber) => this.phoneNumber = phoneNumber;
  void displayContactInfo() {
    print('''
name: $name 
phone number: $phoneNumber
''');
  }

  void updateContactDetails(String newName, String newPhoneNum) {
    newName != name && newName.isNotEmpty
        ? setName = newName
        : print('The name u\'ve entered is not valid');
    newPhoneNum.length == 11
        ? setPhoneNum = newPhoneNum
        : print('The number u\'ve entered is not valid');
  }
}
