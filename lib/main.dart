import 'package:flutter/material.dart';
import 'package:quiz_lab_app/config/navigation/app_navigation.dart';
import 'package:quiz_lab_app/config/theme/theme.dart';
import 'package:quiz_lab_app/config/theme/util.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://wfdywdbsbvmgmdhlfokn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndmZHl3ZGJzYnZtZ21kaGxmb2tuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQyMzE3OTgsImV4cCI6MjA0OTgwNzc5OH0.jC4MFFeKhYYUp7AG5mCAB0VokyQFW5msNslpjn1DMuc',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const TestScreen(),
      //   '/login': (context) => const LoginScreen(),
      //   '/account': (context) => const AccountScreen(),
      // },
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
