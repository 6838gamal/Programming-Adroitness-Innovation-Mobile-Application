import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context, listen: false);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(24)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/logo.png', width: 44, height: 44, fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('براعة وابتكار', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text('منصة تعليمية لتعلم البرمجة', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.smart_toy),
              title: const Text('الوكيل الذكي'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/agent');
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('مسار التعلم'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/lessons');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('من نحن'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('التواصل مع المطور'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: const Icon(Icons.rss_feed),
              title: const Text('متابعة القنوات'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/follow');
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.dark_mode),
                  const SizedBox(width: 8),
                  const Text('الوضع الداكن'),
                  const Spacer(),
                  Switch(
                    value: app.themeMode == ThemeMode.dark,
                    onChanged: (_) {
                      app.toggleTheme();
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
