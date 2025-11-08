import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart';

class FollowScreen extends StatelessWidget {
  const FollowScreen({super.key});

  Future<void> _openUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تعذر فتح الرابط')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('متابعة القنوات')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('قنواتنا الرسمية', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.telegram),
              title: const Text('قناة التليجرام'),
              onTap: () => _openUrl(context, 'https://t.me/digitalspacestore_affiliate'),
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Pinterest'),
              onTap: () => _openUrl(context, 'https://www.pinterest.com/gamalalmaqtary6838/'),
            ),
          ],
        ),
      ),
    );
  }
}
