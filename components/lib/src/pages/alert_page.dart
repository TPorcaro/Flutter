import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertPage'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Show Alert'),
        style: ElevatedButton.styleFrom(
            primary: Colors.blue, shape: StadiumBorder()),
        onPressed: () => _showAlert(context),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Alert Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('This is the alert container text'),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          );
        });
  }
}
