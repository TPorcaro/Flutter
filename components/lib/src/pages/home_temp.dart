import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({super.key});
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _createItems(),
      ),
    );
  }

  List<Widget> _createItems() {
    return options.map((element) {
      return Column(
        children: [
          ListTile(
            title: Text(element),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(
            color: Colors.redAccent,
          )
        ],
      );
    }).toList();
  }
}
