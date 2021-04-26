import 'dart:async';
import 'dart:io';

void main() {
  /*  1
  var stream = Stream.periodic(Duration(seconds: 2), (x) => x)
  .take(10); // 1. 스트림 만들기 - 1초마다 데이터를 1개씩 만듬, 10개 까지만.
  stream.listen(print); // 2. 이벤트 처리
  */
  /* 2
  var stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  stream.first.then((value) => print('stream.first: $value'));
  // 가장 앞의 데이터만 가져온다 - 결과 : 1

  stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  var r = await stream.last;
  print(r);
  // 가장 마지막의 데이터만 가져옴 - 결과값 : 5

  stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  stream.isEmpty.then((value) => print('stream.isEmpty: $value'));
  // 비어 있는지 확인 - false

  stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  stream.isEmpty.then((value) => print('stream.isEmpty: $value'));
  // 비어 있는지 확인 - false

  stream = Stream.fromIterable([10, 20, 30, 40, 50, 60]);
  stream.length.then((value) => print('stream.length: $value'));
  // 전체 길이 6
  */

  /* 3 map을 사용한 값변경
  var streamMap = Stream.periodic(Duration(seconds: 3), (x) => x)
      .take(3)
      .map((x) => x + 10);
  streamMap.listen(print);
  */

  /* 4 StreamTransformer을 사용한 스트림 변경 사용*/
  var transformer = new StreamTransformer<Object, dynamic>.fromHandlers(
      handleData: (value, sink) {
    sink.add("First: $value"); // Stream Sink는 스트림 이벤트를 받아들이는 곳이다.
    sink.add("Second: $value");
  });
  var stream = Stream.fromIterable(["Good", 1, 2, 3, 4, 5]);
  stream.transform(transformer).listen((value) => print("listen : $value"));

  /* 5 확인필요함
  var numStream = createStream([1,3,5,7,9]); // 스트림을 만든다.
  numStream.listen((int number) => print(number)); // 스트림으로부터 데이터를 받아서 출력을 한다.
  */

  /* 6 StreamSubscription을 사용한 에러, done 처리
  var stream = Stream.periodic(Duration(seconds: 1), (x) => x).take(5);

  StreamSubscription subscription = stream.listen(null);

  subscription.onData((value) {
    // onData : 데이터를 하나씩 처리할때
    print('listen stream : $value');

    if (value == 5) {
      value = 'a';
    }
  });

  subscription.onError((err) => print('error : $err')); // 에러가 났을때
  subscription.onDone(() => print('on done')); // 더 받을 데이터가 없을때
  */

  /* 7 브로드캐스트
  var sc = StreamController.broadcast(); //
  var broadcastStream = sc.stream;
  broadcastStream.listen((v) => print('broadcast1 $v'));
  broadcastStream.listen((v) => print('broadcast2 $v'));
  sc.add(10);
  sc.add(20);
  */

  /* 8 StreamController
  final ctrl = StreamController();
  final subscription = ctrl.stream.listen((data) => print(data));
  // 데이터가 더해질때마다 print 한다

  ctrl.add(10); // 데이터 추가
  bool a = ctrl.hasListener;
  ctrl.
  print(a);
  ctrl.add(200);
  ctrl.add(300);
  ctrl.close(); // 컨트롤러 닫음
  //final StreamSubscription subscription2 = ctrl.stream.listen((data) => print(data)); // 에러발생!asd
  //ctrl.add(950); // 위에서 컨트롤러가 닫혔기에 출력되지 않음.*/
  /* 5 확인필요함
  var numStream = createStream([1, 3, 5, 7, 9]); // 스트림을 만든다.
  numStream.listen((int number) => print(number)); // 스트림으로부터 데이터를 받아서 출력을 한다.
  */
}
/* 8
Stream<int> createStream(List<int> numbers) async* {// yield를 사용한다.
  // async*
  //int a = 1;
  for (var number in numbers) {
    yield number; // yield  return과같지만 반환후 열린채로 계속기다림 Stream과 똑같이 작동함
  }
}
*/
