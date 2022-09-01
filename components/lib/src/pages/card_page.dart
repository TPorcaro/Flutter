import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CardPage')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Title of the card type'),
          subtitle: Text(
              'Subtitle of the card typy name of the card type in the card  type list'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Ok'),
            )
          ],
        )
      ]),
    );
  }

  Widget _cardType2() {
    final card = Container(
        child: Column(children: [
      FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg'),
        fadeInDuration: Duration(milliseconds: 200),
        height: 250.0,
        fit: BoxFit.cover,
      ),
      Container(
        child: Text('Pie de imagen'),
        padding: EdgeInsets.all(10.0),
      )
    ]));
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
