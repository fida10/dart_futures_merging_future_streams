import 'package:futures_merging_future_streams/futures_merging_future_streams.dart';
import 'package:test/test.dart';

void main() {
  test('mergeFutureStreams merges two future streams correctly', () async {
    var stream1 = Stream.fromIterable([Future.value(1), Future.value(3)]);
    var stream2 = Stream.fromIterable([Future.value(2), Future.value(4)]);
    var mergedStream = mergeFutureStreams(stream1, stream2);
    expect(await mergedStream.toList(), containsAllInOrder([1, 2, 3, 4]));
  });

  test('mergeFutureStreams handles empty streams', () async {
    var stream1 = Stream<Future<int>>.empty();
    var stream2 = Stream.fromIterable([Future.value(1)]);
    var mergedStream = mergeFutureStreams(stream1, stream2);
    expect(await mergedStream.toList(), equals([1]));
  });
}
