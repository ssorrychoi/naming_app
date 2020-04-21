
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:korean_words/korean_words.dart';
import 'package:naming_app/kor_saved.dart';

class KorRandomList extends StatefulWidget {
  @override
  _KorRandomListState createState() => _KorRandomListState();
}

class _KorRandomListState extends State<KorRandomList> {
  List<KoreanWords> _randomList = [];
  Set<KoreanWords> _saved = Set<KoreanWords>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Korean Naming App'),
        actions: [
          IconButton(
            icon: Icon(Icons.airplanemode_active),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>KorSavedList(saved: _saved)));
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context, index){
              /// 홀수면 divider();
              if(index.isOdd){
                return Divider();
              }
              var realIndex = index ~/ 2;

              if(realIndex>= _randomList.length){
                _randomList.addAll(generateKoreanWords().take(10));
              }

              return _buildRow(_randomList[realIndex]);
        }),
      ),
    );
  }

  Widget _buildRow(KoreanWords pair) {

    final bool alreadySaved = _saved == null ? false : _saved.contains(pair);

    return ListTile(
      title: Text(pair.myeongsa,textScaleFactor: 1.5,),
      trailing: IconButton(
        icon: alreadySaved ? Icon(Icons.check,color: Colors.red,) : Icon(Icons.check),
        onPressed: (){
          setState(() {
            alreadySaved ? _saved.remove(pair) : _saved.add(pair);
            print(_saved);
          });
        },
      ),
    );
  }
}
