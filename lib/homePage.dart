import 'package:flutter/material.dart';
import 'package:pastester/main.dart';
import 'f.dart';
import 'ContactPage.dart';

class HomePage extends StatelessWidget {
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
            'معلومات عامة',
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
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
            'أهمية أمن المعلومات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text( textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            'أمن المعلومات يلعب دورًا حاسمًا في حماية البيانات الحساسة والمعلومات الشخصية من الوصول غير المصرح به والاستخدام غير القانوني. يتضمن أمن المعلومات ثلاثة جوانب رئيسية:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text( textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            '1. السرية: يضمن الحفاظ على سرية المعلومات والوصول إليها فقط من قبل الأشخاص المصرح لهم.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text( textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            '2. التوافر: يتعلق بتوفير المعلومات والخدمات بشكل مستمر وموثوق به للأشخاص المرخص لهم.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text( textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            '3. السلامة: يشمل حماية المعلومات من التلف أو التلاعب أو الاختراقات الضارة.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'حماية الحسابات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text( textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            'حماية الحسابات تعني تأمين حسابات المستخدمين من الاختراق والوصول غير المصرح به. يجب على المستخدمين اختيار كلمات مرور قوية ومختلفة لكل حساب وتحديثها بشكل منتظم. ينصح باستخدام آلية التحقق الثنائي لتعزيز الأمان. يجب أيضًا توعية المستخدمين بأن يكونوا حذرين فيما يتعلق بالرسائل الاحتيالية والروابط المشبوهة.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'نصائح لأمان معلوماتك:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text( textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            '1. استخدم كلمات مرور قوية وفريدة لكل حساب.',
            style: TextStyle(fontSize: 16),
          ),

          SizedBox(height: 8),
          Text( textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        '2. قم بتحديث كلمات المرور بشكل منتظم.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Text( textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        '3. استخدم آلية التحقق الثنائي عند توفرها.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 8),
      Text( textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        '4. كن حذرًا عند التعامل مع الرسائل الاحتيالية والروابط المشبوهة.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasswordPage(),
                    ),
                  );
                },
                child: Text('اختبر قوة كلمة مرورك '),
              ),
      ],
    ),
    ),
    );
  }
}