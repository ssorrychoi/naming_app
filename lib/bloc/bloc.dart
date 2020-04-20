import 'dart:async';

import 'package:english_words/english_words.dart';

class Bloc{
  final Set<WordPair> saved = Set<WordPair>();

  final _savedController = StreamController<Set<WordPair>>.broadcast();

  get savedStream => _savedController.stream;

  get addcurrentSaved => _savedController.sink.add(saved);

  addToOrRemoveFromSavedList(WordPair item){
    saved.contains(item) ? saved.remove(item) : saved.add(item);
    _savedController.sink.add(saved);
  }


  dispose(){
    _savedController.close();
  }
}
var bloc = Bloc();
