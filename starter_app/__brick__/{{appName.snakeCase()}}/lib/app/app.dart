import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{appName.snakeCase()}}/app/app_router.dart';
import 'package:{{appName.snakeCase()}}/app/injection_container.dart';
import 'package:{{appName.snakeCase()}}/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:{{appName.snakeCase()}}/features/user_profile/presentation/bloc/user_profile_bloc.dart';

class {{appName.pascalCase()}} extends StatelessWidget {
  const {{appName.pascalCase()}}({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<AuthenticationBloc>()..add(AuthInit()),
        ),
        BlocProvider(
          create: (_) => locator<UserProfileBloc>()..add(UserProfileLoad()),
        ),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          AppRouter.router.refresh();
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
