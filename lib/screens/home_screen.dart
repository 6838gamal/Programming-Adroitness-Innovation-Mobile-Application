import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('براعة وابتكار')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/logo.png', width: 72, height: 72, fit: BoxFit.contain),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('مرحبًا في براعة وابتكار', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('منصة تفاعلية لتعلم البرمجة بالممارسة. ابدأ الآن مع الوكيل الذكي أو استكشف مسارات التعلم.'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'ابدأ مع الوكيل الذكي',
                    onPressed: () => Navigator.pushNamed(context, '/agent'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/lessons'),
                    child: const Text('مسار التعلم'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('آخر التحديثات', style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text('تحديث ${index + 1}'),
                    subtitle: const Text('نبذة قصيرة عن التحديث أو المحتوى الجديد.'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
