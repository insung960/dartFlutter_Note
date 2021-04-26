import 'dart:io';

/*Synchronous
sync* 속성을 함수가 가지게 된다.
Iterable object 를 리턴한다.
*/

/*
// 1코드상에서 선언된 순간에 바로 데이터가 처리되지 않고 실제로 사용할 때 데이터가 처리
Iterable<int> generatorSync(int n) sync* {
  int k = 0;
  while (k < n) {
    yield k++;
    sleep(Duration(seconds: 2));
  }
}

testGS(int n) {
  print('call generatorSync()');
  var gs = generatorSync(n);
  print('generatorSync() ends');
  for (var value in gs) {
    print(value);
  }
}

void main() {
  testGS(5);
}
*/

/* 2
yield 비동기 또는 동기 생성기에서 값을 내보내는 데 사용
yield* 다른 생성기에 호출을 위임하고 해당 생성기가 값 생성을 중지 한 후 자체 값 생성을 다시 시작
Iterable<int> generatorSync(int n) sync* {
  if (n > 0) {
    yield n;
    sleep(Duration(seconds: 2));
    yield* generatorSync(n - 1);
  }
}

testGS(int n) {
  print('call generatorSync()');
  var gs = generatorSync(n);
  print('generatorSync() ends');
  gs.forEach(print);
}

void main() {
  testGS(5);
}
*/

/*
Asynchronous
generator 동작을 비동기식으로 수행 한다.
async* 속성을 함수가 가지게 된다.
Stream object 를 리턴한다.
*/
/* 3
Stream<int> generatorAsync(int n) async* {
  int k = 0;
  while (k < n) {
    yield k++;
    sleep(Duration(seconds: 2));
  }
}

testGAS(int n) {
  print('call generatorAsync()');
  generatorAsync(n).listen(print);
}

void main() {
  testGAS(5);
}
*/
/*
Future<int> downloadNothing(int n) async {
  return n;
}

/*
Stream<int> generatorAsync(int n) async* {
  int k = 0;
  while (k < n) {
    yield await downloadNothing(k++);
    sleep(Duration(seconds: 1));
  }
}
*/
Stream<int> generatorAsync(int n) async* {
  if (n > 0) {
    yield await downloadNothing(n);
    sleep(Duration(seconds: 1));
    yield* generatorAsync(n - 1);
  }
}

testGAS(int n) {
  print('call generatorAsync()');
  generatorAsync(n).listen(print);
}

void main() {
  testGAS(5);
}
*/
