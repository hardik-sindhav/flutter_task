import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{

  isSignIn(bool checkLogin)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isSignIn", checkLogin);
  }

  setUserToken(String token)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("userToken", token);
  }

  Future checkSignIn()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("isSignIn");
  }

  Future getUserToken()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("userToken");
  }

  logOut()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("isSignIn");
  }

}