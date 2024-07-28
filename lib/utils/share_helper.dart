import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  void setBookMarkData(List<String> cityList)async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("bookMark", cityList);
  }
  Future<List<String>?> getBookMarkData()
  async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    List<String>? cityList=shr.getStringList("cityList") ;
    return cityList;
  }
}

Future<void> setCity(List<String> cityList) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setStringList("bookmark", cityList);
}

Future<List<String>?> getCityData() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  return shr.getStringList("bookmark");
}

void setThemeName({required bool isTheme}) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setBool("theme", isTheme);
}

Future<bool?> getThemeName() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  return shr.getBool("theme");
}