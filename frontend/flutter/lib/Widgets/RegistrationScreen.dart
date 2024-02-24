import 'package:code/Widgets/LoginRegistrationForm.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: const LoginRegistrationForm(
        isLogin: false,
      ),
    );
  }
}
