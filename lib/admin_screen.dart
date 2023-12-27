import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String email = '';
  String age = '';
  String type = '';

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData()async {
    SharedPreferences sp =await SharedPreferences.getInstance();

    email = sp.getString('email')!;
    age = sp.getString('age')!;
    type = sp.getString('userType')!;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Admin View'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email'),
                Text(email.toString()),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Age'),
                Text(age.toString()),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Type'),
                Text(type.toString()),
              ],
            ),
            const SizedBox(height: 20),
             InkWell(
                onTap: () async {
                 SharedPreferences sp =await SharedPreferences.getInstance();

                 sp.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                 
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(color: Colors.green,
                  borderRadius: BorderRadius.circular(10)),
                  child:const Center(child: Text('Logout')),
                ),
              )
          ],
        ),
      ),
    );
  }
}
