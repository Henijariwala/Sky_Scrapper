import 'package:flutter/cupertino.dart';
import 'package:weather_app/screen/detail/view/detail_screen.dart';
import 'package:weather_app/screen/home/view/home_screen.dart';
import 'package:weather_app/screen/splash/view/splash_screen.dart';

Map<String , WidgetBuilder> app_routes ={
  '/':(context) =>const SplashScreen(),
  'home':(context) =>const HomeScreen(),
  'detail':(context) =>const DetailScreen(),
};