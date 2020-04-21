import 'package:flutter/material.dart';
import 'package:korean_words/korean_words.dart';

class KorSavedList extends StatefulWidget {
  KorSavedList({@required this.saved});

  final Set<KoreanWords> saved;

  @override
  _KorSavedListState createState() => _KorSavedListState();
}

class _KorSavedListState extends State<KorSavedList> {
  @override
  Widget build(BuildContext context) {
//    var saved = Set<KoreanWords>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Korean'),
      ),
      body: _buildList(),
//      Container(
//        child: ListView.builder(
//          itemCount: saved.length*2,
//            itemBuilder: (context, index) {
//              if (index.isOdd) {
//                return Divider();
//              }
//          }),
//      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: widget.saved.length * 2,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          }
          var realIndex = index ~/ 2;
          return _buildRow(widget.saved.toList()[realIndex]);
        });
  }

  Widget _buildRow(KoreanWords pair) {
    return ListTile(
      onTap: (){
        setState(() {
          widget.saved.remove(pair);
        });

      },
      title: Text(pair.myeongsa,textScaleFactor: 1.5,),
    );
  }
}
