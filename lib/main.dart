
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pastester/hello.dart';

import 'f.dart';


//import 'package:share/share.dart';
//import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';

import 'dart:math';
import 'ContactPage.dart';
import 'homePage.dart';


void main() {





  runApp(const PasswordApp());
}






Widget myLayoutWidget() {
  return const Padding(
    padding: EdgeInsets.all(40.0),
   
  );
}

class PasswordApp extends StatelessWidget {
  const PasswordApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return padding();
    return MaterialApp(

      title: 'Pass Tester',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,


        //margin: EdgeInsets.symmetric(vertical: 30),

      ),

      home: MyApps(),

    );
  }
}

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  String password = '';
  String passwordStrength = '';
  TextEditingController textEditingController = TextEditingController();


  void checkPassword(String value) {
    setState(() {
      password = value;
      passwordStrength = validatePassword(password);
    });
  }

  String validatePassword(String password) {
    if ((password.length > 8 && password.length<=11) && password.contains(RegExp(r'[0-9]')) && password.contains(RegExp(r'[A-Za-z]')) && password.contains(RegExp(r'[!@#$%\^&\*\(\)]{1,}')))
    {
      return ' كلمة المرور جيدة يجب ان تكون اطول من11 لتصبح قوية ';
    }
    else if (password.length > 11  && password.contains(RegExp(r'[0-9]')) && password.contains(RegExp(r'[A-Za-z]')) && password.contains(RegExp(r'[!@#$%\^&\*\(\)]{1,}')))
    {
      return 'كلمة المرور قوية';
    }

    else if ((password.length > 1 && password.length<=5) && password.contains(RegExp(r'[0-9]')) && password.contains(RegExp(r'[A-Za-z]')) && password.contains(RegExp(r'[!@#$%\^&\*\(\)]{1,}')))
    {
      return 'كلمة المرورضعيفة جداً';
    }
    else if ((password.length > 5 && password.length<=8) && password.contains(RegExp(r'[0-9]')) && password.contains(RegExp(r'[A-Za-z]')) && password.contains(RegExp(r'[!@#$%\^&\*\(\)]{1,}')))
    {
      return 'كلمة المرورضعيفة';
    }
    else
    {
      return ' يجب ادخال كلمة المرور تحتوي على حروف وارقام ورموز';
    }

  }

  void generatePassword() {
    setState(() {
      password = generateRandomPassword();//randomAlphaNumeric(10);
      passwordStrength = 'Generated Password';
      // TextEditingController.clear();

    });
  }
  String generateRandomPassword() {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+[{]}\\|;:\',<.>/?';
    final random = Random();
    final StringBuffer StringBuilder = StringBuffer();

    for (var i = 0; i < 16; i++) {
      final index = random.nextInt(characters.length);
      StringBuilder.write(characters[index]);
    }

    return StringBuilder.toString();
  }


  void copyPassword() {
    Clipboard.setData(ClipboardData(text: password));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password copied to clipboard')),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                iconSize: 50,
                color: Colors.white,
                icon: Icon(Icons.menu), // يمكنك تغيير الرمز هنا
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          backgroundColor: Colors.cyan.shade600,
          title: const Text(
            'اختبار  كلمة المرور',




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
              bottom: Radius.circular(10),
            ),
          ),
          elevation: 0.0,
        ),


      ),

      drawer: Drawer(


        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CircleAvatar(

                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'example@example.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('حول'),
              onTap: () {
                Navigator.pop(context); // إغلاق الدراور
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('تواصل'),
              onTap: () {
                Navigator.pop(context); // إغلاق الدراور
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('سياسة الخصوصية'),
              onTap: () {
                Navigator.pop(context); // إغلاق الدراور
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('خروج'),
              onTap: () {
                Navigator.pop(context); // إغلاق الدراور
                // إغلاق التطبيق
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/s.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        //padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            


            const SizedBox(height: 10.0),

            const Text(' -  تعتبر كلمة المرور من اهم وسائل حماية الاشياء الخاصة سواءً الحسابات الالكترونية او الاجهزة .' ,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.1,
                color: Colors.white,

              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10.0),

            const SizedBox(height: 10.0),
            const Text(' -  يمكنك استخدام خليط من حروف وارقام ورمز وبطول اكبر11  للتمكن من الحصول على كلمة مرور قوية ,   ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.1,
                color: Colors.white,

              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,

            ),


            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('معلومات حول اختيار كلمة المرور '),

                      content: const Text('  \nلإنشاء كلمة مرور قوية، يجب أن تتضمن بعض الخصائص الهامة التي تجعلها صعبة التخمين. هذه الخصائص تشمل:'

                          '  1. طول الكلمة المرورية: يجب أن تكون كلمة المرور على الأقل 12 حرف ورقم ورمز على الأقل، وكلما زاد طولها كلما زادت قوتها.\n'

                        '2. الاستخدام المتنوع للأحرف: يجب أن تحتوي كلمة المرور على مزيج من الأحرف الكبيرة والصغيرة والأرقام والرموز الخاصة مثل ! و @ و # و  وغيرها                                \n '

                          '   3. عدم استخدام المعلومات الشخصية: يجب تجنب استخدام معلومات شخصية سهلة التوقع مثل اسم المستخدم أو تاريخ الميلاد في كلمة المرور.                             \n'
                        '4. الاستخدام المبتكر للكلمات: يمكن استخدام عبارات تكون صعبة التخمين ولكنها معروفة لديك بسهولة. مثلاً، جملة طويلة وغير منطقية تحتوي على مزيج من الحروف والأرقام والرموز.',



                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                    style: TextStyle(
                      height: 2.5,
                    fontWeight: FontWeight.bold,
                    ),

                    ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );


              },
              child: const Text('كيف تختار كلمة مرورك',
                style: TextStyle(
                  fontWeight: FontWeight.bold,




                  fontSize: 19.0,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 2.0,

                ),),

            ),
            const SizedBox(height: 15.0),
            // IntputDecoration.collapsed(hintText:)
            //SizedBox(color:),
            //ColoredBox(color: Color)
            const Text(' ادخل كلمة المرور',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
                color: Colors.white,

              ),
            ),

            TextField(
              obscureText: false,
              onChanged: checkPassword,
              controller: textEditingController,
              //controller:




              decoration: const InputDecoration(
                //  labelText: 'Enter Password',
                prefixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white,
                //hintText: generatePassword,
                //textEditingController.clear(),






                labelStyle: TextStyle( fontWeight: FontWeight.bold,color: Colors.black,fontSize: 28),
                //  labelStyle: TextStyle(),
                // fillColor: Colors.white,
                // border: OutlineInputBorder(
                //  borderRadius: BorderRadius.circular(8.0),
                // hintStyle: TextStyle(color: Colors.white)
                // style: TextٍٍStyle(color: Colors.green),
                //

              ),
              onTap: () {
                setState(() {
                  textEditingController.clear();

                });
              },

            ),

            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Password Strength'),
                      content: Text(passwordStrength),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                         child: const Text('OK'),
    ),
    ],
    );
    },
    );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(50, 40)),
                fixedSize: MaterialStateProperty.all(const Size(200, 20)),// تعيين الحجم المطلوب
              ),
              child: const Text('فحص كلمة المرور'),
              //SizedBox(width: 20.0),
            ),
            const SizedBox(height: 20.0),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(50, 40)),
                fixedSize: MaterialStateProperty.all(const Size(200, 20)),// تعيين الحجم المطلوب
              ),

              onPressed:() {
                textEditingController.clear();
                password=generateRandomPassword();
                // password=generatePassword();
                textEditingController.text= password;


              },



              child: const Text('اقتراح كلمة مرور',
              ),
              // textEditingController.clear();


            ),




          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 20.0,
          child: const Icon(Icons.copy),
          onPressed: (

              ){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('copy password'),
                  content: Text(password),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      child: const Text('Close'),
                    ),
                    const SizedBox(height: 20.0),
                    Visibility(
                      visible: password.isNotEmpty,
                      child: ElevatedButton(
                        onPressed: copyPassword,
                        child: const Text('Copy Password'),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    //SizedBox()

                  ],

                );
              },
            );
          }
      ),
    );
  }
}