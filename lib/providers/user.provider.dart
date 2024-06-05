
import 'package:flutter/cupertino.dart';
import 'package:meta_app/models/user.model.dart';

import '../resource/auth.resource.dart';

class UserProvider with ChangeNotifier{
  UserModel? _user;
  final AuthMethods _authMethods = AuthMethods();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async{
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

}