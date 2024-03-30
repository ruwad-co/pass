
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//import 'package:share/share.dart';
//import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';

import 'dart:math';

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

      home: const PasswordPage(),

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
    if (password.length > 8 && password.contains(RegExp(r'[0-9]')) && password.contains(RegExp(r'[A-Za-z]')) && password.contains(RegExp(r'[!@#$%\^&\*\(\)]{1,}')))
    {
      return 'كلمة المرور قوية';
    }
    else if (password.length > 8 && password.contains(RegExp(r'[0-9]'))  && password.contains(RegExp(r'[A-Za-z]'))  )
    {
      return 'كلمة المرور متوسطة يمكنك اضافة رموز لتصبح كلمة المرور قوية';
    }
    else
    {
      return ' كلمة المرور ضعيفة يجب استخدام رموز وحرف وارقام لتصبح كلمة المرور قوية';
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

    for (var i = 0; i < 12; i++) {
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

        //preferredSize: Size.fromHeight(50.40),
        preferredSize: const Size.fromHeight(kToolbarHeight),
        //maintainAnimation: true,


        // تعيين ارتفاع مخصص هنا
        child: AppBar(



          // padding: EdgeInsets.only(top: 20),
          //title: const Text('اختبار كلمة المرور'),


          toolbarHeight: 90.0,
          title: Container(
            width: 800.100,
            height: 70.0,

            padding: const EdgeInsets.only(top: 20.20),
            //padding: EdgeInsets.only(right: 20.40),// ازاحة بالقيمة المطلوبة
            child: const Text('Password Tester',
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.black,
              ),),

          ) ,
          // actions: [Text('A text')],

          backgroundColor: Colors.cyan,
          elevation: 10,
          titleSpacing: 10,
          //elevation: 0,
          //padding: EdgeInsets.zero,
        ),


      ),

      drawer: const Drawer(
        elevation: 66.0,
        child: Column(
          children: <Widget>[


            UserAccountsDrawerHeader(

              accountName: Text(" "),
              accountEmail: Text("password Tester"),
              decoration: BoxDecoration(

                color: Colors.cyan, // Set the desired background color
              ),


              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("xyz"),
                //leading: new Icon(Icons.stacked_line_chart),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("abc"),
                )
              ],
            ),
            ListTile(
              title: Text("حول"),
              leading: Icon(Icons.stacked_line_chart),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title:  Text("مشاركة"),
              leading:  Icon(Icons.share),
            ),
            ListTile(
              title: Text("سوشال ميديا"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("تواصل"),
              leading: Icon(Icons.contact_mail),
            ),
            ListTile(
              title: Text("اعدادات"),
              leading: Icon(Icons.settings),
            )
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

            const Text(


              'Password Security Information:',
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.cyan,
              ),
            ),


            const SizedBox(height: 10.0),

            const Text(' -  تعتبر كلمة المرور من اهم وسائل حماية الاشياء الخاصة سواءً الحسابات الالكترونية او الاجهزة .' ,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
                color: Colors.white,

              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10.0),

            const SizedBox(height: 10.0),
            const Text(' -  يمكنك استخدام خليط من حروف وارقام ورمز وبطول اكبر 8 للتمكن من الحصول على كلمة مرور قوية ,   ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
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
                          '  1. طول الكلمة المرورية: يجب أن تكون كلمة المرور على الأقل 12 حرفًا على الأقل، وكلما زاد طولها كلما زادت قوتها.\n'
                        '2. الاستخدام المتنوع للأحرف: يجب أن تحتوي كلمة المرور على مزيج من الأحرف الكبيرة والصغيرة والأرقام والرموز الخاصة مثل ! و @ و # و  وغيرها                                 '
                        '   3. عدم استخدام المعلومات الشخصية: يجب تجنب استخدام معلومات شخصية سهلة التوقع مثل اسم المستخدم أو تاريخ الميلاد في كلمة المرور.                         '
                        '4. الاستخدام المبتكر للكلمات: يمكن استخدام عبارات تكون صعبة التخمين ولكنها معروفة لديك بسهولة. مثلاً، جملة طويلة وغير منطقية تحتوي على مزيج من الحروف والأرقام والرموز.',



                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
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
              child: const Text('للمزيد من المعلومات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,


                  fontSize: 18.0,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 3.0,

                ),),

            ),
            const SizedBox(height: 15.0),
            // IntputDecoration.collapsed(hintText:)
            //SizedBox(color:),
            //ColoredBox(color: Color)
            const Text(' Enter Password',
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
              child: const Text('Test   Password'),
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



              child: const Text('Generate Password',
              ),
              // textEditingController.clear();


            ),




          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 20.0,
          child: const Icon(Icons.add),
          onPressed: (){
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