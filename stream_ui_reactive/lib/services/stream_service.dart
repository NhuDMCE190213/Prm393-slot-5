import 'dart:async';

class StreamService {
  final StreamController<int> _controller = StreamController<int>();
  int _counter = 0;
  Stream<int> get stream => _controller.stream;
  void start() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _counter++;
      _controller.add(_counter);
    });
  }

  void dispose() {
    _controller.close();
  }
}
