import 'dart:math';

import 'package:the_movie_db/feature/domain/data_providers/user_data_provider.dart';
import 'package:the_movie_db/feature/domain/entities/user.dart';

class UserService {
  var _user = User(0);
  User get user => _user;
  final _userDataProvider = UserDataProvider();
  void decrement() {
    _user = user.copyWith(age: max(user.age - 1, 0));
            _userDataProvider.saveValue(_user);

  }

  void increment() {
    _user = user.copyWith(age: user.age + 1);
    _userDataProvider.saveValue(_user);
  }

  Future<void> initialize() async {
    _user = await _userDataProvider.loadValue();
  }
}
