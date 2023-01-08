import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String LoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";

  static Future<bool?> getUserLoggedInStatus() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(LoggedInKey);
  }
}