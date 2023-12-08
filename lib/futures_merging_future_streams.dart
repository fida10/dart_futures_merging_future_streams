/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';

export 'src/futures_merging_future_streams_base.dart';

/*
Practice Question 3: Merging Future Streams

Task:

Write a function mergeFutureStreams that takes two Stream<Future<int>> 
and merges them into a single stream. 
The merged stream should emit values as soon as they are resolved from either of the input streams.
 */

Stream<int> mergeFutureStreams(Stream<Future<int>> x, Stream<Future<int>> y) async* {
  final iterOne = StreamIterator(x);
  final iterTwo = StreamIterator(y);
  //creating two iterators to be able to iterate over the two available streams.

  while(await iterOne.moveNext() && await iterTwo.moveNext()){
    yield await iterOne.current;
    yield await iterTwo.current;
  } //yield the contents of iterOne followed by iterTwo one after the other
  //continue doing this while both have elements

  while(await iterOne.moveNext()){
    yield await iterOne.current;
  }

  while(await iterTwo.moveNext()){
    yield await iterTwo.current;
  }
  //handling spares (if iterOne is larger, add these additional elements, and vice versa for iterTwo)
}