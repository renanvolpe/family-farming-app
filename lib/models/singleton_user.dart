import 'package:organaki_app/models/user.dart';

class SingletonUser {
  //here is a service auth when the user login
  //then, can use stories values inside whole code
  //like bloc, pages, services...

  late User _userAuth;

  static final SingletonUser _singletonUser = SingletonUser._internal();

  factory SingletonUser() {
    return _singletonUser;
  }

  SingletonUser._internal();

  setUserAuth(User value) {
    _userAuth = value;
  }

  User get userAuth => _userAuth;
}
