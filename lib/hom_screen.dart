// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preference/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String email = '';
  String age = '';

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData()async {
    SharedPreferences sp =await SharedPreferences.getInstance();

    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('HomeScreen'),
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
                Text('Email'),
                Text(email.toString()),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Age'),
                Text(age.toString()),
              ],
            ),
            SizedBox(height: 20),
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