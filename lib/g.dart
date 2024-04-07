//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Login',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto",
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          elevation: 0.0,
        ),
      ),
      backgroundColor: Colors.white,

      body: Center(

        child: Padding(
          padding: const EdgeInsets.only(right:50.0,top:10.0,bottom: 70.9,left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.account_circle,
                size: 120,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: usernameController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(

                  hintText: 'اسم المستخدم',
                  hintStyle: const TextStyle(color: Colors.black),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  prefixIcon: const Icon(Icons.person, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'كلمة المرور',
                  hintStyle: const TextStyle(color: Colors.black),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // التحقق من صحة اسم المستخدم وكلمة المرور
              if (usernameController.text == 'admin' &&
                  passwordController.text == 'password') {
                // في حالة كانت البيانات صحيحة، قم بفتح صفحة الاختبار
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasswordPage()),
                );
              } else {
                // في حالة كانت البيانات غير صحيحة، عرض رسالة خطأ
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('خطأ'),
                      content: const Text('اسم المستخدم أو كلمة المرور غير صحيحة'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('حسناً'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            icon: const Icon(Icons.login), // أيقونة تسجيل الدخول
            label: const Text('تسجيل الدخول'),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  padding: const EdgeInsets.only(right: 50,bottom: 30),// EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>  const PasswordPage(),
                  ),
                  ); // أداء عملية تسجيل الدخول
                },
                icon: const Icon(Icons.person_add), // أيقونة تسجيل الدخول
                label: const Text('انشاء حساب'),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  padding: const EdgeInsets.only(right: 50,bottom: 60),// EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 0),


            ],

          ),
        ),

      ),
    );
  }
}
