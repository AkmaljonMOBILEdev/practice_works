import 'package:flutter/material.dart';
import 'package:main_project/data/models/prayer_times_model.dart';
import 'package:main_project/data/network/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   PrayerTimesModel? prayerTimesModel;
  ApiProvider apiProvider = ApiProvider();
  bool isLoading=false;

  _fetchData()async{
    setState(() {
      isLoading=true;
    });
    prayerTimesModel = (await apiProvider.getTimes('Khorezm'))!;
    setState(() {
      isLoading=false;
    });
  }
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Namoz vaqtlari"),
      ),
      body: isLoading
              ? const Center(child: CircularProgressIndicator(),)
              : Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(prayerTimesModel!.region, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 10,),
            Text(prayerTimesModel!.date, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 10,),
            Text(prayerTimesModel!.date, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 10,),
            Text(prayerTimesModel!.weekday, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 30,),
            Row(
              children: [
                Text(prayerTimesModel!.times.tong,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueAccent
                ),),
                const Spacer(),
                Text(prayerTimesModel!.times.quyosh,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueAccent
                ),),
                const Spacer(),
                Text(prayerTimesModel!.times.peshin,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueAccent
                ),),
                const Spacer(),
                Text(prayerTimesModel!.times.asr,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueAccent
                ),),
                const Spacer(),
                Text(prayerTimesModel!.times.shom,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueAccent
                ),),
                const Spacer(),
                Text(prayerTimesModel!.times.xufton,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blueAccent
                ),),
              ],
            )
          ],
        ),
      ),

    );
  }
}
