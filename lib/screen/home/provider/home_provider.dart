import 'package:flutter/material.dart';
import 'package:weather_app/screen/home/model/home_model.dart';

import '../../../utils/api_helper.dart';
import '../../../utils/share_helper.dart';

class HomeProvider with ChangeNotifier
{
  Future<HomeModel?>? model;
  String citySearch = 'surat';
  List<String>? bookMark=[];
  bool isOn = true;
  bool theme = false;
  bool isTheme = false;
  ThemeMode mode = ThemeMode.dark;
  IconData themeMode = Icons.dark_mode;

  void changeTheme() {
    isOn = !isOn;
    notifyListeners();
  }
  void setThemeData() async {
    theme = !theme;
    setThemeName(isTheme: theme);
    isTheme = (await getThemeName())!;
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }

  void getThemeData() async {
    if (await () == null) {
      isTheme = false;
    } else {
      isTheme = (await getThemeName())!;
    }
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    }
    notifyListeners();
  }

  void setBookMarks(String url)
  {
    getBookMarks();
    bookMark!.add(url);
    SharedHelper share = SharedHelper();
    share.setBookMarkData(bookMark!);
    getBookMarks();
    notifyListeners();
  }

  Future<void> getBookMarks(  )
  async {
    SharedHelper share = SharedHelper();
    var l1 = await share.getBookMarkData();
    if(l1!=null)
    {
      bookMark =l1;
    }
    notifyListeners();
  }

  void deleteContact(int r)
  {
    getBookMarks();
    bookMark!.removeAt(r);
    setCity(bookMark!);
    getBookMarks();
    notifyListeners();

  }
  void getweather(String city) {
    Api_helper helper = Api_helper();
    model = helper.weatherApi(city);

    model!.then((value) {
      if (value != null) {
        notifyListeners();
      }
    },
    );
  }
}