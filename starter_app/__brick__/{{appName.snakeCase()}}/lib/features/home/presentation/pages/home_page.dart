import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:{{appName.snakeCase()}}/app/injection_container.dart';
import 'package:{{appName.snakeCase()}}/core/widgets/black_appbar.dart';
import 'package:{{appName.snakeCase()}}/features/home/presentation/bloc/quote_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    {{#useAuth}}
    late Map userMap;
    {{/useAuth}}

  @override
  void initState() {
    super.initState();
    {{#useAuth}}
    userMap = locator<Box>().get('userMap');
    {{/useAuth}}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        {{^useAuth}}
        appBar: blackAppBar("Quote of the Day", "",
            "https://api.dicebear.com/8.x/fun-emoji/png", context),
        {{/useAuth}}
        {{#useAuth}}
        appBar: blackAppBar("Quote of the Day", userMap['nickname'],
            userMap['pictureUrl'], context),
        {{/useAuth}}

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Flexible(
              flex: 1,
              child: BlocBuilder<QuoteBloc, QuoteState>(
                builder: (context, state) {
                  if (state is QuoteLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is QuoteLoaded) {
                    return Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Flexible(flex: 1, child: Container()),
                          Flexible(
                            flex: 5,
                            child: Tooltip(
                              message: "Click for fun facts!",
                              preferBelow: false,
                              child: TextButton(
                                onPressed: () {
                                  context.push('/info');
                                },
                                child: Text('"${state.quote}"',
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 24)),
                              ),
                            ),
                          ),
                          Flexible(flex: 1, child: Container()),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ]),
        ));
  }
}
