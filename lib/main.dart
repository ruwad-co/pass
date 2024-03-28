import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';
import 'dart:io';
import 'package:share/share.dart';
//import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';

void main() {





    runApp(PasswordApp());
  }






Widget myLayoutWidget() {
  return Padding(
    padding: EdgeInsets.all(40.0),
    // child: Text("Hello world!"),
  );
}

class PasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return padding();
    return MaterialApp(

      title: 'pass tester',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,


        //margin: EdgeInsets.symmetric(vertical: 30),

      ),

      home: PasswordPage(),

    );
  }
}

class PasswordPage extends StatefulWidget {
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
    final StringBuilder = StringBuffer();

    for (var i = 0; i < 12; i++) {
      final index = random.nextInt(characters.length);
      StringBuilder.write(characters[index]);
    }

    return StringBuilder.toString();
  }


  void copyPassword() {
    Clipboard.setData(ClipboardData(text: password));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(

        //preferredSize: Size.fromHeight(50.40),
        preferredSize: Size.fromHeight(kToolbarHeight),
        //maintainAnimation: true,


        // تعيين ارتفاع مخصص هنا
        child: AppBar(



          // padding: EdgeInsets.only(top: 20),
          //title: const Text('اختبار كلمة المرور'),


          toolbarHeight: 90.0,
          title: Container(
            width: 800.100,
            height: 70.0,

            padding: EdgeInsets.only(top: 20.20,left: 150.40),
            //padding: EdgeInsets.only(right: 20.40),// ازاحة بالقيمة المطلوبة
            child: Text('اختبار قوة كلمة المرور',
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

      drawer: Drawer(
        elevation: 66.0,
        child: Column(
          children: <Widget>[


            UserAccountsDrawerHeader(

              accountName: Text(" "),
              accountEmail: Text("Pass tester"),
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
              title: new Text("حول"),
              leading: new Icon(Icons.stacked_line_chart),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("مشاركة"),
              leading: new Icon(Icons.share),
            ),
            ListTile(
              title: new Text("سوشال ميديا"),
              leading: new Icon(Icons.people),
            ),
            ListTile(
              title: new Text("تواصل"),
              leading: new Icon(Icons.contact_mail),
            ),
            ListTile(
              title: new Text("اعدادات"),
              leading: new Icon(Icons.settings),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/s.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        //padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(


              'Password Security Information:',
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.cyan,
              ),
            ),


            SizedBox(height: 10.0),

            Text(' -  تعتبر كلمة المرور من اهم وسائل حماية الاشياء الخاصة سواً الحسابات الالكترونية او الاجهزة .' ,

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
                color: Colors.white,

              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10.0),
            Text(' -  عند اخيارك لكلمة المرور يجيب عليك مراعاة عدم استخدام ملعوماتك الشخصية .  ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
                color: Colors.white,

              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10.0),
            Text(' -  يمكنك استخدام خليط من حروف وارقام ورمز وبطول اكبر 8 للتمكن من الحصول على كلمة مرور قوية ,   ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
                color: Colors.white,

              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),


            SizedBox(height: 15.0),
            // IntputDecoration.collapsed(hintText:)
            //SizedBox(color:),
            //ColoredBox(color: Color)
            Text(' Enter Password',
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




          decoration: InputDecoration(
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
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Password Strength'),
                      content: Text(passwordStrength),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(50, 40)),
                fixedSize: MaterialStateProperty.all(Size(200, 20)),// تعيين الحجم المطلوب
              ),
              child: Text('Test   Password'),
              //SizedBox(width: 20.0),
            ),
            SizedBox(height: 20.0),

            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(50, 40)),
                fixedSize: MaterialStateProperty.all(Size(200, 20)),// تعيين الحجم المطلوب
              ),

              onPressed:() {
                textEditingController.clear();
                password=generateRandomPassword();
               // password=generatePassword();
                textEditingController.text= password;


              },



        child: Text('Generate Password',
              ),
               // textEditingController.clear();


            ),




          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 20.0,
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('copy password'),
                  content: Text(password),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      child: Text('Close'),
                    ),
                    SizedBox(height: 20.0),
                    Visibility(
                      visible: password.isNotEmpty,
                      child: ElevatedButton(
                        onPressed: copyPassword,
                        child: Text('Copy Password'),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    //SizedBox()
                    ElevatedButton(
                      onPressed: generatePassword,
                      child: Text('Save Password',
                      ),

                    ),
                  ],

                );
              },
            );
          }
      ),
    );
  }
}