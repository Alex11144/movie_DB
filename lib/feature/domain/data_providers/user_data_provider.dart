import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_db/feature/domain/entities/user.dart';

class UserDataProvider {

  final sharedPreferences = SharedPreferences.getInstance();

  Future<User> loadValue() async {
    final age = (await sharedPreferences).getInt('age') ?? 0;
    return User(age);
  }

  void saveValue(User user) async {
    (await sharedPreferences).setInt('age', user.age);
  }
}
