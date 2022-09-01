import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumbers = [];
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _add10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  int _lastItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListPage')),
      body: Stack(children: [_createList(), _createLoading()]),
    );
  }

  _createList() {
    return RefreshIndicator(
      onRefresh: getBasePage,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          final indexImage = _listNumbers[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/id/$indexImage/500/300'));
        },
        itemCount: _listNumbers.length,
      ),
    );
  }

  _add10() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        _lastItem++;
        _listNumbers.add(_lastItem);
      }
    });
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    new Timer(new Duration(seconds: 2), () {
      _isLoading = false;
      _add10();
      _scrollController.animateTo(_scrollController.position.pixels + 100,
          duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  _createLoading() {
    if (_isLoading) {
      return Column(
        children: [
          Row(
            children: [CircularProgressIndicator()],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 15.0,
          )
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
      );
    } else {
      return Container();
    }
  }

  Future<void> getBasePage() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _add10();
    });
    return Future.delayed(duration);
  }
}
