import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_padding/easy_padding.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
DateTime _nextScheduledDate() {
  final now = DateTime.now();
  final nextDate = now.add(const Duration(days: 5));
  return DateTime(nextDate.year, nextDate.month, nextDate.day, 9, 0);
}
void main() {



  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon'); // استبدل 'app_icon' بالأيقونة المطلوبة

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    runApp(PasswordApp());
  }


}



Widget myLayoutWidget() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    // child: Text("Hello world!"),
  );
}

class PasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return padding();
    return MaterialApp(

      title: 'اختبار كلمة المرور',
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
    else if (password.length > 8 && password.contains(RegExp(r'[0-9]'))  && password.contains(RegExp(r'[A-Za-z]')) || !password.contains(RegExp(r'[!@#$%\^&\*\(\)]{1,}')) )
    {
      return 'كلمة المرور متوسطة';
    }
    else
    {
      return 'كلمة المرور ضعيفة';
    }

  }

  void generatePassword() {
    setState(() {
      password = randomAlphaNumeric(8);
      passwordStrength = 'Generated Password';
    });
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
        preferredSize: Size.fromHeight(30.20),

        // تعيين ارتفاع مخصص هنا
        child: AppBar(
          // padding: EdgeInsets.only(top: 20),
          //title: const Text('اختبار كلمة المرور'),


          toolbarHeight: 70.0,
          title: Container(
            padding: EdgeInsets.only(top: 5.0), // ازاحة بالقيمة المطلوبة
            child: Text('اختبار كلمة المرور'),
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
        child: ListView(
          padding: EdgeInsets.zero,

          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'PASSWORD SECURTY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: ( ) {
                Text('ghfhfgh');
                //'تنفيذ الإجراء الخاص بعنصر القائمة المحدد (مثلاً: افتح الصفحة الرئيسية)
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('ABOUT'),
              onTap: () {
                // تنفيذ الإجراء الخاص بعنصر القائمة المحدد (مثلاً: افتح الصفحة الرئيسية)
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // تنفيذ الإجراء الخاص بعنصر القائمة المحدد (مثلاً: افتح صفحة الإعدادات)
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('contact'),
              onTap: () {
                // تنفيذ الإجراء الخاص بعنصر القائمة المحدد (مثلاً: افتح صفحة الإعدادات)
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('share'),
              onTap: () {
                // تنفيذ الإجراء الخاص بعنصر القائمة المحدد (مثلاً: افتح صفحة الإعدادات)
              },
            ),
          ],

        ),

      ),

      body: Container(
        padding: EdgeInsets.all(0.0),

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/s.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        //padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Password Security Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),


            SizedBox(height: 16.0),

            Text(' - Password should be at least 8 characters long.',

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.cyan,

              ),
            ),
            Text(' - Password should contain both letters and numbers.',
            ),

            SizedBox(height: 32.0),
            // IntputDecoration.collapsed(hintText:)
            //SizedBox(color:),
            //ColoredBox(color: Color)
            TextField(
              obscureText: true,
              onChanged: checkPassword,
              decoration: InputDecoration(
                labelText: 'Enter Password',
                prefixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black,fontSize: 20),
                //  labelStyle: TextStyle(),
                // fillColor: Colors.white,
                // border: OutlineInputBorder(
                //  borderRadius: BorderRadius.circular(8.0),
                // hintStyle: TextStyle(color: Colors.white)
                // style: TextٍٍStyle(color: Colors.green),
                //

              ),
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
              child: Text('Test Password'),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: generatePassword,
              child: Text('Generate Password',
              ),

            ),
            SizedBox(height: 30.0),
            //SizedBox()
            ElevatedButton(
              onPressed: generatePassword,
              child: Text('Save Password',
              ),

            ),
            SizedBox(height: 30.0),
            Text(
              'Generated Password: $password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.cyan,
              ),
            ),

            SizedBox(height: 20.0),
            Visibility(
              visible: password.isNotEmpty,
              child: ElevatedButton(
                onPressed: copyPassword,
                child: Text('Copy Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _savedText = '';

  Future<void> _saveToFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    await file.writeAsString(_textEditingController.text);
    setState(() {
      _savedText = _textEditingController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حفظ الملف')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}