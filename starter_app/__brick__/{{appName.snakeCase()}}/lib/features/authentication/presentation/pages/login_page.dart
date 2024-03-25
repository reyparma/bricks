import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/presentation/bloc/authentication_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text('{{appTitle}}',
                style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.black87),
      body: Center(
        child: Column(children: [
          const Spacer(),
          const Flexible(
              flex: 10,
              child: Text(
                  'This app uses Go_Router for navigation\n and BloC for state management',
                  textAlign: TextAlign.center)),
          const Spacer(),
          Flexible(
            flex: 2,
            child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(LogIn());
                },
                child: const Text('Login')),
          )
        ]),
      ),
    );
  }
}
