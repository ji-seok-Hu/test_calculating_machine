// import 'dart:ffi';
// import 'dart:math';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'sun.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ""),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 버튼 클릭 시 num_list에 값 추가하고 UI 업데이트


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            height: 180,
            color: const Color.fromARGB(255, 118, 107, 138),
            child: Row(
              children: [
                Text(
                  num_list.join(), // 리스트에 추가된 값들 합쳐서 표시
                  style: TextStyle(fontSize: 60),
                )
              ],
            ),
          ),
          Container(
            height: 180,
            color: Colors.purpleAccent,
            child: Row(
              children: [
                Text(
                  result(), // 결과 표시
                  style: TextStyle(fontSize: 60),
                )
              ],
            ),
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: FilledButton(
              onPressed: () {
                setState(() {
                  num_list = [""]; // 리스트 초기화
                });
              },
              child: Text(
                '지우기',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: FilledButton(
              onPressed: () {
                setState(() {
                  num_list.clear();
                  num_empy.clear();
                  num_formula.clear();
                  num_sign.clear();
                  num_ssin = [0];
                  num_sssin.clear();
                });
              },
              child: Text(
                '초기화',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          // 숫자 버튼들
          for (var i = 0; i <= 9; i++)
            SizedBox(
              width: 100,
              height: 100,
              child: FilledButton(
                onPressed: () {
                  setState(() => addToExpression(i.toString()));
                  addToExpressions(i.toString());
                },
                child: Text(
                  '$i',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          // 연산자 버튼들
          SizedBox(
            width: 100,
            height: 100,
            child: FilledButton(
              onPressed: () {
                addToExpression("+");
                addToExpressions("Y");
                addToExpressionsss("+");
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: FilledButton(
              onPressed: () {
                addToExpression("-");
                addToExpressions("Y");
                addToExpressionsss("-");
              },
              child: Text(
                '-',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: FilledButton(
              onPressed: () {
                addToExpression("*");
                addToExpressions("z");
                addToExpressionss("*");
              },
              child: Text(
                'x',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: FilledButton(
              onPressed: () {
                addToExpression("/");
                addToExpressions("z");
                addToExpressionss("/");
              },
              child: Text(
                '/',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          // 기타 버튼들
          SizedBox(
            width: 100,
            height: 100,
            child: FilledButton(
              onPressed: () {
                addToExpression(".");
                addToExpressions(".");
              },
              child: Text(
                '.',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          // 계산 버튼 (=)
          SizedBox(
            width: 100,
            height: 100,
            child: FilledButton(
              onPressed: () {
                setState(() {
                num_result();
                  
                });
              },
              child: Text(
                '=',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
