import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/presentation/bloc/authentication_bloc.dart';

AppBar blackAppBar(
    String title, String nickname, String pictureUrl, BuildContext context) {
  return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Center(
          child: Text(title, style: const TextStyle(color: Colors.white))),
      backgroundColor: Colors.black87,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(nickname, style: const TextStyle(color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 16,
            child: ClipOval(
              child: Image.network(
                pictureUrl,
              ),
            ),
          ),
        ),
      {{#useAuth}}
                  IconButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(LogOut());
              },
              icon: const Icon(Icons.logout, color: Colors.white))
      {{/useAuth}}  
      ]);
}
