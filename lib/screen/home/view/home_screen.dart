import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/component/network/provider/network_provider.dart';
import 'package:weather_app/component/network/view/network_widget.dart';
import 'package:weather_app/screen/home/model/home_model.dart';
import 'package:weather_app/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController txtName = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NetworkProvider>().checkConnection();
    context.read<HomeProvider>().getweather("surat");
  }
  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            showBookMark();
          }, icon: const Icon(Icons.bookmark)),
          IconButton(
              onPressed: () {
                providerR!.setThemeData();
              },
              icon: Icon(providerW!.theme == true
                  ? Icons.light_mode
                  : Icons.dark_mode)),
        ],
      ),
      body:
      context.watch<NetworkProvider>().isInternet
        ? SingleChildScrollView(
          child: FutureBuilder(
            future: context.watch<HomeProvider>().model,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                Text("${snapshot.error}");
              }
              else if (snapshot.hasData)
              {
                HomeModel? model = snapshot.data;
                if (model == null)
                {
                  const Text("Not Available");
                }
                else
                {
                  return Center(
                      child: Container(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          decoration:  BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/image/img.jpg"),
                                   opacity: providerW!.isTheme?0.5:1,
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SearchBar(
                                    controller: txtName,
                                    hintText: "Search.... ",
                                    elevation:
                                    const MaterialStatePropertyAll(0.3),
                                    trailing: [
                                      IconButton(
                                        onPressed: () {
                                          context.read<HomeProvider>().getweather(txtName.text);
                                        },
                                        icon: const Icon(Icons.search),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Text("${model.name}",style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,)),
                                const SizedBox(height: 15,),
                                TextButton(onPressed: () {
                                  Navigator.pushNamed(context, 'detail');
                                },
                                  child: Text("${model.cloudsModel!.all}°C",
                                      style:  TextStyle(
                                          fontSize: 35,fontWeight: FontWeight.bold,color:providerW!.isTheme? Colors.white:Colors.black)),),
                                Text("${model.weatherList![0].main}", style: const TextStyle(
                                    fontSize: 25,),
                                ),
                                const SizedBox(height: 90),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [Colors.white24, Colors.black12],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                const Icon(Icons.wind_power),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Wind Speed",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.windModel!.speed} km/h",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 130,),
                                            Column(
                                              children: [
                                                const Icon(Icons.thermostat),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Temperature",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.mainModel!.temp} km/h",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                const Icon(Icons.water_drop),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Humidity",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.mainModel!.humidity}%",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 160,),
                                            Column(
                                              children: [
                                                const Icon(Icons.speed),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Pressure",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.mainModel!.pressure} km/h",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                const Icon(Icons.thermostat_outlined),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Feels like",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.mainModel!.feels_like}",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 160,),
                                            Column(
                                              children: [
                                                const Icon(Icons.remove_red_eye),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Visibility",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.visibility}km",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                const Icon(Icons.thermostat_auto),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Max Temp.",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.mainModel!.temp_max}",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 160,),
                                            Column(
                                              children: [
                                                const Icon(Icons.thermostat_auto),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                  "Min Temp.",style: TextStyle(
                                                    fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                ),
                                                Text(
                                                  "${model.mainModel!.temp_min} ",style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [Colors.white24, Colors.black12],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                const Icon(Icons.sunny_snowing),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                    "Sunrise",style: TextStyle(
                                                  fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                    ),
                                                Text(
                                                    "${model.sysModel!.sunrise}",style: const TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),
                                                    ),
                                              ],
                                            ),
                                            const SizedBox(width: 160,),
                                            Column(
                                              children: [
                                                const Icon(Icons.sunny_snowing),
                                                const SizedBox(height: 5,),
                                                const Text(
                                                    "Sunset",style: TextStyle(
                                                  fontWeight: FontWeight.bold,fontSize: 18
                                                ),
                                                    ),
                                                Text(
                                                    "${model.sysModel!.sunset} ",style: const TextStyle(
                                                  fontWeight: FontWeight.bold
                                                ),
                                                    ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          )
                      )
                  );
                }
              }
              return const Center(child: CircularProgressIndicator());
            }
                ),
        ) :const Network_Widget()
    );
  }
  void showBookMark()
  {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(onClosing: () {}, builder: (context) {
          return Expanded(
            child: ListView.builder(
              itemCount: providerW!.bookMark!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    providerW!.getweather(providerW!.bookMark![index]);
                    Navigator.pop(context);
                  },
                  title: Text(providerW!.bookMark![index],style: const TextStyle(overflow: TextOverflow.ellipsis),),
                );
              },
            ),
          );
        },);
      },
    );
  }
}

