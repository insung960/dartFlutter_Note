//Dart에서는 모든 클래스에는(Object 제외) 하나의 super 클래스만 있다.
//여러 클래스 계층에서 클래스의 코드를 재사용 할 수있는 방법이 필요
//Mixin은 하나 이상의 클래스 계층에서 클래스의 코드를 재사용하는 방법입니다. -  Dart.org
//클래스를 상속하지 않고 상속한 것 처럼 메소드를 사용할 수 있는 클래스

// class Animal {
//   void move() {
//     print('move Postion');
//   }

//   void run() {
//     print('move Postion by Run');
//   }
// }

// mixin canSwim {
//   void swim() {
//     print('move Postion by Swim');
//   }
// }
// mixin canFly {
//   void fly() {
//     print('move Postion by Fly');
//   }
// }
// mixin canRun {
//   void run() {
//     print('move Postion by Runaaaaa');
//   }
// }

// class Duck extends Animal with canFly, canRun, canSwim {
//   @override
//   void move() {
//     swim();
//     fly();
//     run();
//   }
// }

// void main() {
//   Duck().move();
// }

//2
////with을 붙여서 다른 클래스의 속성(?)을 가져올 수 있다.
// class Walker {
//   void walk() {
//     print("I'm walking");
//   }
// }

// class Flyer {
//   void fly() {
//     print("I'ma flying");
//   }
// }

// class Mammal {}

// class Bird {}

// class Cat extends Mammal with Walker {}

// class Dove extends Bird with Walker, Flyer {}

// main(List<String> args) {
//   Cat cat = Cat();
//   Dove dove = Dove();

//   cat.walk();
//   dove.walk();
//   dove.fly();
// }

//3
//AB 클래스와 BA 클래스 모두 A 및 B 믹스로 P 클래스를 확장하지만 다른 순서로 확장
//선언된 순서가 중요
// class A {
//   String getMessage() => 'A';
// }

// class B {
//   String getMessage() => 'B';
// }

// class P {
//   String getMessage() => 'P';
// }

// class AB extends P with A, B {}

// class BA extends P with B, A {}

// main(List<String> args) {
//   String result = '';

//   AB ab = AB();
//   result += ab.getMessage();
//   //B

//   BA ba = BA();
//   result += ba.getMessage();
//   //A

//   print(result);
// }

//4(더 공부 필요)
// abstract class Super {
//   void method() {
//     print("Super");
//   }
// }

// class MySuper implements Super {
//   void method() {
//     print("MySuper");
//     print("MySuper");
//   }
// }

// mixin Mixin on Super {
//   //on은 Mixin 선언을 한 곳을 어디에 적용할 것 인가 지정해줌.
//   void method() {
//     super.method();
//     print("Sub");
//   }
// }

// class Client extends MySuper with Mixin {}

// void main() {
//   Client().method();

// // MySuper
// // Sub
// }
