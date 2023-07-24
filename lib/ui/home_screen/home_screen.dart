import 'package:flutter/material.dart';
import 'package:main_project/data/models/data_model.dart';
import 'package:main_project/data/models/uni_response.dart';
import 'package:main_project/data/network/api_provider.dart';
import 'package:main_project/ui/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  bool isLoading = false;
  int currentPage=1;
  int countOfPage=5;

  List<DataModel> data = [];

  _fetch()async{
    setState(() {
      isLoading=true;
    });
    UniversalResponse universalResponse = await ApiProvider().fetchInfo(page: currentPage, count: countOfPage);

    if(universalResponse.error.isEmpty){
      data.addAll(universalResponse.data);
    }

    setState(() {
      isLoading=false;
    });
    currentPage++;
  }

  @override
  void initState() {
    // _fetch();
    controller.addListener(() {
      if (controller.position.pixels ==
          controller.position.maxScrollExtent) {
        _fetch();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            _fetch();
          }, icon: const Icon(Icons.get_app))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: controller,
              padding: const EdgeInsets.symmetric(vertical: 10),
              physics: const BouncingScrollPhysics(),
              children: List.generate(data.length, (index){
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DetailScreen(dataModel: data[index], index: index);
                    }));

                  },
                  title: Text(data[index].name),
                  subtitle: Text(data[index].trips.toString(),
                  ),
                );
              }),
            ),
          ),
          Visibility(
              visible: isLoading,
              child: const Center(child: CircularProgressIndicator(),))
        ],
      ),
    );
  }
}
