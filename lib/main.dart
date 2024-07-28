import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/app_routes.dart';
import 'package:weather_app/screen/home/provider/home_provider.dart';
import 'component/network/provider/network_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: NetworkProvider()),
      ChangeNotifierProvider.value(value: HomeProvider())],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getThemeData();
      value.changeTheme();
      value.theme = value.isTheme;
      value.isOn == value.theme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: value.mode,
      );
    }),
  ));
}
