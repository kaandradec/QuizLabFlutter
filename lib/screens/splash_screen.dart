import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_lab_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final session = supabase.auth.currentSession;
    if (session != null) {
      // Navigator.of(context).pushReplacementNamed('/account');
      context.goNamed('Home');
    } else {
      // Navigator.of(context).pushReplacementNamed('/login');
      context.goNamed('Login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
