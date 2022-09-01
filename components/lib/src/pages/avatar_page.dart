import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AvatarPage'),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://img.a.transfermarkt.technology/portrait/header/28003-1631171950.jpg?lm=1'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/232/628/products/messi-01-305x2051-0f5ffcd90b94a4e08716513321864588-1024-1024.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
