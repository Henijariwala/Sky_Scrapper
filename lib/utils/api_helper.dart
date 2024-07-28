import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app/screen/home/model/home_model.dart';
class Api_helper
{
  Future<HomeModel?> weatherApi(String city)
  async {
   String apiLink ="https://api.openweathermap.org/data/2.5/weather?q=$city&appid=10e53e07180425654991833f5f05e8c3";

   var response = await http.get(Uri.parse(apiLink));
   if (response.statusCode == 200) {
     var json = jsonDecode(response.body);
     //print(json);
     HomeModel homeModel = HomeModel.mapToModel(json);
     return homeModel;
   }
   return null;
  }
}
