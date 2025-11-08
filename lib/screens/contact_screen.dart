import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const String whatsappNumber = '967774440982';
  static const String telegramUrl = 'https://t.me/digitalspacestore_affiliate';

  Future<void> _openWhatsApp(BuildContext context) async {
    final Uri uri = Uri.parse('https://wa.me/$whatsappNumber');
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تعذر فتح واتساب')));
    }
  }

  Future<void> _openTelegram(BuildContext context) async {
    final Uri uri = Uri.parse(telegramUrl);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تعذر فتح تليجرام')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التواصل مع المطور')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Text('طرق التواصل', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.whatsapp, color: Colors.green),
              title: const Text('واتساب'),
              subtitle: Text('+${whatsappNumber}'),
              onTap: () => _openWhatsApp(context),
            ),
            ListTile(
              leading: const Icon(Icons.telegram, color: Colors.blue),
              title: const Text('قناة التليجرام'),
              subtitle: const Text('DigitalSpaceStore'),
              onTap: () => _openTelegram(context),
            ),
          ],
        ),
      ),
    );
  }
}
