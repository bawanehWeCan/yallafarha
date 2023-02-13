import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static const String keyIsLogIn = "key_isLogIn";
  static const String keyAccessToken = "key_access_token";
  static const String keyPoints = "key_points";
  static const String keyEmail = "key_email";
  static const String keyFullName = "key_full_name";
  static const String keyProfilePic = "key_profile_pic";
  static const String keyUserName = "key_user_name";
  static const String keyIsPassedIntro = "key_is_passed_intro";
  static const String keyLanguage = "key_language";
  static const String keyImage = "key_image";


  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearProfile() {
    accessToken = "";
    isLogIn = false;
    points = 0;
    email = "";
    fullName = "";
    userName = "";
    email = "";
    profilePic = "";
    userId = 0;
    userImage = "";
  }

  static String get accessToken => _sharedPreferences.getString(keyAccessToken) ?? "";
  static set accessToken(String value) => _sharedPreferences.setString(keyAccessToken, value);

  static String get deviceToken => _sharedPreferences.getString('device_token') ?? "";
  static set deviceToken(String value) => _sharedPreferences.setString('device_token', value);

  static bool get isLogIn => _sharedPreferences.getBool(keyIsLogIn) ?? false;
  static set isLogIn(bool value) => _sharedPreferences.setBool(keyIsLogIn, value);

  static bool get isPassedIntro => _sharedPreferences.getBool(keyIsPassedIntro) ?? false;
  static set isPassedIntro(bool value) => _sharedPreferences.setBool(keyIsPassedIntro, value);

  static String get language => _sharedPreferences.getString(keyLanguage) ?? "";
  static set language(String value) => _sharedPreferences.setString(keyLanguage, value);

  static String get email => _sharedPreferences.getString(keyEmail) ?? "";
  static set email(String value) => _sharedPreferences.setString(keyEmail, value);

  static String get userName => _sharedPreferences.getString(keyUserName) ?? "";
  static set userName(String value) => _sharedPreferences.setString(keyUserName, value);

  static int get points => _sharedPreferences.getInt(keyPoints) ?? 0;
  static set points(int value) => _sharedPreferences.setInt(keyPoints, value);

  static String get fullName => _sharedPreferences.getString(keyFullName) ?? "";
  static set fullName(String value) => _sharedPreferences.setString(keyFullName, value);

  static String get profilePic => _sharedPreferences.getString(keyProfilePic) ?? "";
  static set profilePic(String value) => _sharedPreferences.setString(keyProfilePic, value);

  static int get userId => _sharedPreferences.getInt('user_id') ?? 0;
  static set userId(int value) => _sharedPreferences.setInt('user_id', value);

  static String get userImage => _sharedPreferences.getString(keyImage) ?? "";
  static set userImage(String value) => _sharedPreferences.setString(keyImage, value);
}
