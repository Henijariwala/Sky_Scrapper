import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/home_model.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                                  image: const AssetImage("assets/image/detail_screen.jpg"),
                                  opacity: providerW!.isTheme?0.5:1,
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Center(child: Text("Country",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                                  Text("Country =${model.sysModel!.country}",style: const TextStyle(fontSize: 25),),
                                  Text("TimeZone =${model.timezone}",style: const TextStyle(fontSize: 25),),
                                  const Divider(),
                                  const Center(child: Text("City",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                                  Text("City =${model.name}",style: const TextStyle(fontSize: 25),),
                                  Text("Longitude =${model.coordModel!.lon}",style: const TextStyle(fontSize: 25),),
                                  Text("Latitude =${model.coordModel!.lat}",style: const TextStyle(fontSize: 25),),
                                  const Divider(),
                                  const Text("Wind",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 2, color: Colors.grey.shade500),
                                      gradient: const LinearGradient(
                                        colors: [Colors.white24, Colors.black12],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            const Text(
                                              "Speed ",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const Icon(Icons.air),
                                            Text(
                                              "${model.windModel!.speed} ",
                                              style: const TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              " Deg",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const Icon(Icons.cloud,color: Colors.white,),
                                            Text(
                                              "${model.windModel!.deg} ",
                                              style: const TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              "Visibility",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const Icon(Icons.device_thermostat_sharp,color: Colors.orangeAccent,),
                                            Text(
                                              "${model.visibility} ",
                                              style: const TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("Temp.",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 2, color: Colors.grey.shade500),
                                      gradient: const LinearGradient(
                                        colors: [Colors.white24, Colors.black12],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            const Text(
                                              "Temp.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const Icon(Icons.thermostat_auto,color: Colors.white,),
                                            Text(
                                              "${model.mainModel!.temp} ",
                                              style: const TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              "Min Temp.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const Icon(Icons.thermostat,color: Colors.orangeAccent,),
                                            Text(
                                              "${model.mainModel!.temp_min} ",
                                              style: const TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              "Max Temp.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const Icon(Icons.device_thermostat_sharp,color: Colors.white,),
                                            Text(
                                              "${model.mainModel!.temp_max} ",
                                              style: const TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2, color: Colors.grey.shade500),
                                        gradient: const LinearGradient(
                                          colors: [Colors.white24, Colors.black12],
                                        ),
                                      ),
                                    child:  const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              SizedBox(width: 10),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Now",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.cloud,
                                                    color: Colors.white
                                                  ),
                                                  Text(
                                                    "18°",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  Text(
                                                    "11:00 Am",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.sunny,
                                                    color: Colors.orangeAccent
                                                  ),
                                                  Text(
                                                    "17°",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  Text(
                                                    "12:00Pm",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.sunny,
                                                    color: Colors.orangeAccent
                                                  ),
                                                  Text(
                                                    "18°",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  Text(
                                                    "01:00 Pm",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.cloud,
                                                    color: Colors.white
                                                  ),
                                                  Text(
                                                    "15°",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  Text(
                                                    "02:00 Pm",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.cloud,
                                                    color: Colors.white
                                                  ),
                                                  Text(
                                                    "19°",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  Text(
                                                    "03:00 Pm",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.cloud,
                                                    color: Colors.white
                                                  ),
                                                  Text(
                                                    "19°",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                  )
                                    )
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2, color: Colors.grey.shade500),
                                        gradient: const LinearGradient(
                                          colors: [Colors.white24, Colors.black12],
                                        ),
                                      ),
                                    child:  const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('1/Today',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                  Text('☀️',style: TextStyle(fontSize: 20),),
                                                  Text('20°/33°',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('2/Mon .',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                  Text('🌨️',style: TextStyle(fontSize: 20),),
                                                  Text('26°/32°',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('3/Tue .',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                  Text('🌨️',style: TextStyle(fontSize: 20),),
                                                  Text('28°/34°',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('4/Wed .',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                  Text('🌨️',style: TextStyle(fontSize: 20),),
                                                  Text('28°/35°',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('5/Thu .',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                  Text('🌤️',style:
                                                    TextStyle(fontSize: 20),),
                                                  Text('25°/30°',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('6/Fri   .',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                  Text('🌤️',style: TextStyle(fontSize: 20),),
                                                  Text('25°/32°',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('7/Sat  .',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                  ),),
                                                  Text('🌤️',style: TextStyle(fontSize: 20),),
                                                  Text('25°/32°',style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                ],
                                              ),
                                            ],
                                          )
                                  )
                                    )
                                  ),
                                ]
                            ),
                          )
                      )
                  );
                }
              }
              return const Center(child: CircularProgressIndicator());
            }
        ),
      ),
    );
  }
}