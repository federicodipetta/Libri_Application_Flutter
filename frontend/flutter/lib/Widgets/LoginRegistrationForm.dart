import 'package:code/Providers/AuthProvider.dart';
import 'package:code/Providers/RecensioneProvider.dart';
import 'package:code/Providers/UtenteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginRegistrationForm extends StatefulWidget {
  final bool isLogin;
  const LoginRegistrationForm({Key? key, required this.isLogin})
      : super(key: key);

  @override
  _LoginRegistrationFormState createState() => _LoginRegistrationFormState();
}

class _LoginRegistrationFormState extends State<LoginRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            if (!widget.isLogin)
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (widget.isLogin) return null;
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty)
                  return "il campo password non può essere vuoto";
                if (widget.isLogin) return null;
                if (value.length < 8 || value.length > 20) {
                  return 'la password deve essere tra 8 e 20 caratteri';
                }
                if (value.contains(' ') || value.contains('\t')) {
                  return 'la password non deve contenere spazi';
                }
                if (!value.contains(RegExp(r'[A-Z]')) ||
                    !value.contains(RegExp(r'[a-z]')) ||
                    !value.contains(RegExp(r'[0-9]'))) {
                  return 'la password deve contenere almeno una lettera maiuscola, una minuscola e un numero';
                }

                return null;
              },
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text(widget.isLogin ? 'Login' : 'Register'),
            ),
            if (widget.isLogin)
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.inversePrimary,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: Text('Register'),
              ),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (widget.isLogin) {
        bool a = await Provider.of<AuthProvider>(context, listen: false).login(
          usernameController.text,
          passwordController.text,
        );
        if (a) {
          await Provider.of<UtenteProvider>(context, listen: false)
              .fetchUtente();
          await Provider.of<RecensioneProvider>(context, listen: false)
              .getRecensioni();
        }
      } else {
        bool a =
            await Provider.of<AuthProvider>(context, listen: false).register(
          usernameController.text,
          passwordController.text,
          emailController.text,
        );
        if (a) {
          await Provider.of<UtenteProvider>(context, listen: false)
              .fetchUtente();
          await Provider.of<RecensioneProvider>(context, listen: false)
              .getRecensioni();

          Navigator.pop(context);
        }
      }
    }
  }
}
