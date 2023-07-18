import 'package:flutter/material.dart';
import 'package:main_project/data/network/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  _fetch(String word)async{
    String worda=await ApiProvider().getWord(word: word, first: 'en', second: 'uz');
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.translate))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          TextField(
            controller: firstController,
            onChanged: (v)async{
              String name='';
                if(v.isNotEmpty){
                  name=(await ApiProvider().getWord(word: v, first: 'en', second: 'uz'));
                }
                setState(() {
                  secondController.text=name;
                });
                },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.blue
                  )
              )
            ),
          ),
          SizedBox(height: 40,),
          TextField(
            controller: secondController,
            onChanged: (v){

            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.blue
                  )
              )
            ),
          ),
        ],
      ),
    );
  }
}
