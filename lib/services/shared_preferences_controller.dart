import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAuthController {
  late SharedPreferences prefs;

  void saveLoginSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    
  }

  void logoutSharePreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}
