import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //공통 부모가 상태를 관리
  //상태 - 헤더한테 넘겨줌
  int num = 1;
  //행위  - 바텀한테 넘겨줌
  void add() {
    setState(() {
      num = num + 1;
    });
  }

  //build될 때 뉴 되는 것
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: HeaderPage(num)),
            //여기서는 함수의 이름만 전달해야함 ex add() X add O
            //1급 객체는 레퍼런스 주소가 있기 때문에 이렇게 함수를 이름만으로 전달 가능
            Expanded(child: BottomPage(add)),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  final num;
  HeaderPage(this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Align(
        child: Text(
          "$num",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {
  final add;
  BottomPage(this.add);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            print("버튼 클릭됨");
            add();
          },
          child: Text(
            "증가",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}
//하얀니 옹니 짱 화이탱탱탱
