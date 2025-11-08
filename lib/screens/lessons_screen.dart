import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مسار التعلم')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: ListTile(
              title: const Text('المستوى: مبتدئ'),
              subtitle: const Text('مقدمة في البرمجة — المتغيرات، الشروط، الحلقات'),
              trailing: ElevatedButton(
                onPressed: () {
                  // فتح صفحة الدرس أو يشغّل مسار
                },
                child: const Text('ابدأ'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('المستوى: متوسط'),
              subtitle: const Text('هياكل البيانات الأساسية والخوارزميات'),
              trailing: OutlinedButton(
                onPressed: () {},
                child: const Text('قريبًا'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
