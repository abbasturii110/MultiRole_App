// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preference/student_screen.dart';
import 'package:shared_preference/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_screen.dart';
import 'hom_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            DropdownButton<String>(
              value: selectedRole,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue;
                });
              },
              items: <String?>[null, 'student', 'teacher', 'admin']
                  .map<DropdownMenuItem<String>>((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value ?? 'Select Role'),
                );
              }).toList(),
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                hintText: 'Email'
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                hintText: 'Password'
              ),
            ),             
            const SizedBox(height: 20,),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                hintText: 'Age'
              ),
            ),
                        const SizedBox(height: 40,),
            InkWell(
              onTap: () async {
               SharedPreferences sp =await SharedPreferences.getInstance();
                sp.setString('email', emailController.text);
                sp.setString('age', ageController.text.toString());
                sp.setBool('isLogin', true);

                sp.setString('userType', selectedRole ?? '');

               switch (selectedRole) {
                  case 'student':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudentScreen()),
                    );
                    break;
                  case 'teacher':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TeacherScreen()),
                    );
                    break;
                  case 'admin':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AdminScreen()),
                    );
                    break;
                  default:
                    // Navigate to default screen (you can customize this part)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                }

                
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(color: Colors.green,
                borderRadius: BorderRadius.circular(10)),
                child:const Center(child: Text('Login')),
              ),
              
            )
          ],
        ),
      ),
    );
  }


}