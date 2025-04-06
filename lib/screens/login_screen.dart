import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_lab_app/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubcription;

  @override
  void initState() {
    super.initState();

    // Solo configurar este listener si no hay sesión activa
    if (supabase.auth.currentSession == null) {
      _authSubcription = supabase.auth.onAuthStateChange.listen((event) {
        final session = event.session;
        if (session != null && mounted) {
          context.goNamed('Home');
        }
      });
    } else if (mounted) {
      // Si ya hay una sesión al iniciar la pantalla, navegar inmediatamente
      context.goNamed('Home');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authSubcription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(label: Text('Email')),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              try {
                final email = _emailController.text.trim();
                await supabase.auth.signInWithOtp(
                  email: email,
                  emailRedirectTo:
                      'io.supabase.flutterquickstart://login-callback/',
                );
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Check your inbox')),
                  );
                }
              } on AuthException catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Error ocurred, please retry, ${error.message}',
                    ),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
