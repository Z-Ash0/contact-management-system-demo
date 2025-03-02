import 'dart:math';

class User {
  String name;
  String _phoneNumber;
  String _email;
  String _password;
  String? _userId;
  String? _address;

  User(
    this.name,
    this._phoneNumber,
    this._email,
    this._password,
    this._address,
  ) : _userId = Random().nextInt(2000).toString();

  get userName => name;
  get phoneNum => _phoneNumber;
  get email => _email;
  get pass => _password;
  get id => _userId;
  get address => _address;

  set setName(String name) => this.name = name;
  set setPhoneNum(String phoneNum) => _phoneNumber = phoneNum;
  set setEmail(String email) => _email = email;
  set setPass(String pass) => _password = pass;
  set setAddress(String address) => _address = address;
  set setId(String? id) => _userId = id;

  void updateUserProfile(String newName, String newPhoneNum) {
    newName.length > 3
        ? setName = newName
        : print('The userName should be more than 3 chars');

    newPhoneNum.length == 11
        ? setPhoneNum = newPhoneNum
        : print('Invalid phone number');
  }

  void updateEmailInfo(String newEmail, String newAddress) {
    newEmail.contains('@') ? setEmail = newEmail : print('Invalid email');
    setAddress = newAddress;
  }

  void deleteAccount(String userId) {
    userId == id
        ? {setId = null, print('Account is deleted, successfully')}
        : print('Invalid user ID');
  }

  void logIn(String email, String pass) {
    email == this.email
        ? pass == this.pass
            ? print('Welcome back, $userName')
            : print('The password u\'ve entered is incorrect')
        : print('The email u\'ve entered is incorrect');
  }

  void logOut() {
    print('Logged out, successfully');
  }

  void resetPassword(String newPass) {
    newPass != pass
        ? newPass.length >= 8
            ? setPass = newPass
            : print('Password should contain more than 8 characters')
        : print('Enter a new password');
  }
}
