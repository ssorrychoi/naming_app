import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:naming_app/saved.dart';
import 'package:naming_app/bloc/bloc.dart';


class RandomList extends StatefulWidget {
  @override
  _RandomListState createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _wordList = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Naming App'),
        actions: [
          IconButton(icon: Icon(Icons.assignment),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SavedList()));
          },)
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
      stream: bloc.savedStream,
      builder: (context, snapshot) {
        return ListView.builder(itemBuilder: (context, index) {
          // 0,2,4,6,8,10 ... => real Items
          // 1,3,5,7,9 ... => divider
          if (index.isOdd) {
            return Divider();
          }

          /// ~/ === 몫
          var realIndex = index ~/ 2;

          if (realIndex >= _wordList.length) {
            _wordList.addAll(generateWordPairs().take(10));
          }

          return _buildRow(snapshot.data, _wordList[realIndex]);
        });
      }
    );
  }

  Widget _buildRow(Set<WordPair> saved,WordPair pair) {

    final bool alreadySaved = saved == null ? false : saved.contains(pair);

    return ListTile(
//      onTap: (){
//        bloc.addToOrRemoveFromSavedList(pair);
//      },
//        trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,color: Colors.pink,),
      trailing: IconButton(
        onPressed: (){
          print(pair.asPascalCase);
          bloc.addToOrRemoveFromSavedList(pair);
          print(saved.toString());
        },
        icon:
        Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,color: Colors.pink,),),
        title: Text(
          pair.asPascalCase,
          textScaleFactor: 2,
        ));
  }
}
