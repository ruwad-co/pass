import 'package:flutter/material.dart';
import 'main.dart';
void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'تطبيق الترحيب',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PasswordPage(),
        ),
      );
    });
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
    child: AppBar(
    backgroundColor: Colors.cyan.shade600,
    title: const Text(
    'Pass Tester',
    style: TextStyle(
    color: Colors.white,
    fontSize: 28.0,
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

      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const SizedBox(height: 16),
            const Text(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.left,
              'مرحبا بك في تطبيق Pass Tester',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text( textDirection: TextDirection.rtl,
             // textAlign: TextAlign.left,
              'احمي حساباتك من التخمين بختبار مدى قوة كلمة مرورك  ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),

    );
  }
}