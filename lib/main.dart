import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_provider.dart';
import 'screens/home_screen.dart';
import 'screens/smart_agent_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/follow_screen.dart';
import 'screens/lessons_screen.dart';

void main() {
  runApp(const BraaahApp());
}

class BraaahApp extends StatelessWidget {
  const BraaahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, app, _) {
          return MaterialApp(
            title: 'براعة وابتكار',
            debugShowCheckedModeBanner: false,
            themeMode: app.themeMode,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
              brightness: Brightness.dark,
            ),
            initialRoute: '/',
            routes: {
              '/': (_) => const HomeScreen(),
              '/agent': (_) => const SmartAgentScreen(),
              '/about': (_) => const AboutScreen(),
              '/contact': (_) => const ContactScreen(),
              '/follow': (_) => const FollowScreen(),
              '/lessons': (_) => const LessonsScreen(),
            },
          );
        },
      ),
    );
  }
}
