import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyPage(),
  ));
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
    child: AppBar(
    backgroundColor: Colors.black,
    title: const Text(
    'السياسة و الخصوصية',
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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'سياسة الخصوصية',
              style: TextStyle(

                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),

            ),
            SizedBox(height: 20),
            Text(
              'نستخدم المعلومات التي نجمعها لتقديم وتحسين خدماتنا، وتخصيص تجربتك، وتزويدك بالمحتوى المناسب والإعلانات.',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            Text(
              'لا نشارك معلوماتك الشخصية مع أطراف ثالثة إلا بموافقتك، ما لم يكن ذلك مطلوبًا قانونيًا أو لحماية حقوقنا',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            Text(
              'لديك الحق في الوصول إلى معلوماتك الشخصية وتصحيحها، وفي بعض الحالات، حذفها، بالإضافة إلى تقديم شكوى إذا كنت غير راضي عن كيفية معالجة بيانات',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
            Text(
              'نحن نحترم خصوصيتك ونتعهد بالتعامل مع معلوماتك بأمان وسرية وفقًا لسياسة الخصوصية هذه. إذا كان لديك أي أسئلة أو استفسارات حول سياسة الخصوصية، يرجى التواصل معانا',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),

            SizedBox(height: 20),
            Text(
              'من نحن',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 25,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 20),
            Text(
              'نحن طلاب قسم CYBER SECURITY في المعهد القدرات العالي للتدريب نقدم لكم هذا التطبيق Pass Tester بإشراف الاستاذة الفاضلة: مروى العطاس.',
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}
