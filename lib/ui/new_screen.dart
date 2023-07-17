import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

  @override
  void initState() {

    super.initState();
  }

  Future<String> getCityName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks.first;
      String cityName = place.street ?? '';
      print("City: $cityName");
      return cityName;
    } catch (e) {
      print('Error: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen",),
        actions: [
          IconButton(onPressed: ()async{
            await getCityName(41.22,69.24);
          }, icon: Icon(Icons.abc), color: Colors.black,)
        ],
      ),

    );
  }
}
