import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        // ignore: avoid_print
        return ListView(
          children: _createListItems(snapshot.data ?? [], context),
        );
      },
    );
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> list = <Widget>[];
    data.forEach((element) {
      final widget = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          final route = MaterialPageRoute(builder: (context) {
            return AlertPage();
          });
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      list.add(widget);
    });
    return list;
  }
}
