// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/admin_screen.dart';
import 'package:shared_preference/hom_screen.dart';
import 'package:shared_preference/login_screen.dart';
import 'package:shared_preference/student_screen.dart';
import 'package:shared_preference/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isLogin(); 
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin')!;

    String userType = sp.getString('userType')!;

    if (isLogin) {

      if(userType == 'Student'){
        Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StudentScreen()));
      });
      }else if(userType == 'Teacher') {
        Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TeacherScreen()));
      });
      }else if(userType == 'Admin'){
        Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminScreen()));
      });
      } else{
        Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
      }
      
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://images.pexels.com/photos/2086622/pexels-photo-2086622.jpeg?auto=compress&cs=tinysrgb&w=600')),
    );
  }
}