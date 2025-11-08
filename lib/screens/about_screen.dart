import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('من نحن')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('من نحن', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text(
              'براعة وابتكار منصة تعليمية تهدف لتمكين المبرمجين الجدد من بناء مهارات عملية عبر محتوى تفاعلي ومشاريع صغيرة قابلة للتطبيق في السوق.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
