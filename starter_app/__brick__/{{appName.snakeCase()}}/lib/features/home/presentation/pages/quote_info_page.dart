import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:{{appName.snakeCase()}}/app/injection_container.dart';
import 'package:{{appName.snakeCase()}}/core/widgets/black_appbar.dart';

class QuoteInfoPage extends StatefulWidget {
  const QuoteInfoPage({super.key});

  @override
  State<QuoteInfoPage> createState() => _QuoteInfoPageState();
}

class _QuoteInfoPageState extends State<QuoteInfoPage> {
  List<ListTile> items = [];

  {{#useAuth}}
  late Map userMap;
  {{/useAuth}}

  @override
  void initState() {
    super.initState();

    {{#useAuth}}
    userMap = locator<Box>().get('userMap');
    {{/useAuth}}

    Map map = locator<Box>().get('quoteInfo');

    items.add(ListTile(
        leading: const Icon(Icons.badge, color: Colors.purple),
        title: Text('Id: ${map['_id']}')));
    items.add(ListTile(
        leading: const Icon(Icons.person, color: Colors.purple),
        title: Text('Author: ${map['author']}')));
    items.add(ListTile(
        leading: const Icon(Icons.numbers_rounded, color: Colors.purple),
        title: Text('Length: ${map['length'].toString()}')));
    items.add(ListTile(
        leading: const Icon(Icons.add, color: Colors.purple),
        title: Text('Date added: ${map['dateAdded']}')));
    items.add(ListTile(
        leading: const Icon(Icons.update, color: Colors.purple),
        title: Text('Date changed: ${map['dateModified']}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        {{^useAuth}}
        appBar: blackAppBar("https://api.quotable.io", "",
            "https://api.dicebear.com/8.x/fun-emoji/png", context),
        {{/useAuth}}

        {{#useAuth}}
        appBar: blackAppBar("https://api.quotable.io", userMap['nickname'],
            userMap['pictureUrl'], context),
        {{/useAuth}}

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child:
                      const Text("Fun Facts", style: TextStyle(fontSize: 30)),
                )),
            Flexible(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(flex: 1, child: Container()),
                  Flexible(
                    flex: 6,
                    child: ListView.separated(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return items[index];
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  ),
                  Flexible(flex: 1, child: Container()),
                ],
              ),
            ),
            Flexible(flex: 2, child: Container(color: Colors.black54))
          ],
        ));
  }
}
