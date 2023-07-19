import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_project/data/models/universal_data.dart';
import 'package:main_project/data/network/providers/api_provider.dart';
import 'package:main_project/ui/home_screen/widgets/get_info.dart';

import '../../data/models/free_user_model/results_model/results_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ResultsModel> results = [];
  ResultsModel? user;
  bool isLoading = false;

  _fetchData()async{
    setState(() {
      isLoading=true;
    });
    UniversalData universalData = await ApiProvider().getUserInfo();
    if(universalData.error.isEmpty){
      results.addAll(universalData.data);
      user = results[0];

    }
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
        title: const Text("User Info"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(),)
          : Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: Image.network(user?.picture ?? ""),
              ),
            ),
            SizedBox(height: 20.h,),
            GetUserInfo(title: "${user?.name.title} ${user?.name.first} ${user?.name.last}", icon: Icons.person),
            SizedBox(height: 8.h,),
            GetUserInfo(title: "${user?.location.street.number}${user?.location.street.name}, ${user?.location.city}, ${user?.location.state}, ${user?.location.country}", icon: Icons.location_on),
            SizedBox(height: 8.h,),
            GetUserInfo(title: user?.email ?? "", icon: Icons.email),
            SizedBox(height: 8.h,),
            GetUserInfo(title: "${user?.login.username ?? ""} | ${user?.login.password ?? ""}", icon: Icons.person),
            SizedBox(height: 8.h,),
            GetUserInfo(title: user?.phone ?? "", icon: Icons.phone),
            SizedBox(height: 8.h,),
            GetUserInfo(title: "${user?.age ?? 0}", icon: Icons.date_range)
          ],
        ),
      ),
    );
  }
}
