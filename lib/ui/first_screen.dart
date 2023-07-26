import 'package:flutter/material.dart';
import 'package:main_project/app_provider/holder_provider.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: Consumer<HolderProvider>(
          builder: (context, provider, child) {
            return Text(
              provider.what.toString(),
              style: TextStyle(
                fontSize: 45,
                color: Colors.green.shade900,
                fontWeight: FontWeight.w800,
              ),
            );
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          var provider = Provider.of<HolderProvider>(context, listen: false);
          provider.changeState();
        },
      ),
    );
  }
}