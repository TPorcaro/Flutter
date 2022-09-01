import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _styleText = new TextStyle(fontSize: 25);
  // ignore: prefer_final_fields
  int _conteo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Taggify'),
          centerTitle: true,
          elevation: 3.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Clicks',
                style: _styleText,
              ),
              Text(
                '$_conteo',
                style: _styleText,
              )
            ],
          ),
        ),
        floatingActionButton: _createFloatingButtons());
  }

  Widget _createFloatingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 30),
        FloatingActionButton(
            onPressed: _reset, child: Icon(Icons.exposure_zero_rounded)),
        Expanded(child: SizedBox()),
        FloatingActionButton(onPressed: _remove, child: Icon(Icons.remove)),
        SizedBox(width: 5),
        FloatingActionButton(onPressed: _add, child: Icon(Icons.add))
      ],
    );
  }

  void _add() {
    setState(() {
      _conteo++;
    });
  }

  void _remove() {
    setState(() {
      if (_conteo != 0) {
        _conteo--;
      }
    });
  }

  void _reset() {
    setState(() {
      _conteo = 0;
    });
  }
}
