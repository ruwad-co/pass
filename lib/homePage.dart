import 'package:flutter/material.dart';
import 'package:pastester/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: Container(
          width: 800.100,
          height: 50.0,

          //padding: const EdgeInsets.only(top: 20.20),
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