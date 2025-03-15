// import 'dart:ffi';
// import 'dart:math';

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> num_list = [""];
List<String> num_sign = [];
List<String> num_empy = []; //선,곱나나
List<String> num_formula = []; //후,플마
List<num> num_ssin = [0];
List<String> num_sssin = [];


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
  void addToExpression(String value) {
    setState(() {
      num_list.add(value);
    });
  }

  void addToExpressions(String value) {
    num_sign.add(value);
  }

  void addToExpressionss(String value) {
    num_formula.add(value);
  }

  void addToExpressionsss(String value) {
    num_sssin.add(value);
  }

  num Specific_number(String value, String target) {
    List<String> temporary = [];
    temporary = value.split(target);
    // [21Y6z3Y6]
    return temporary.length;
  }

  String result() {
    return num_ssin[0].toString();
  }

  void num_result() {
    setState(() {
      num_ssin.clear();
      String result = num_sign.join();
      num_sign.clear();
      num_sign.add(result);
      num_empy = num_sign[0].split('Y');
      // [3,3z3]
      // 21-6X3+6
      // [21Y6z3Y6]
      // num_empy = ["21","6Z3","6"]
      // z들어간걸 따로뻬서 계산하고 그 자리에 다시 돌려놓기 for로 구현
      for (var i = 0; i < num_empy.length; i++) {
        if (num_empy[i].contains("z") == true) {
          // prnum(num_empy);
          //[6x3/3]
          List<String> temporary = [];

          num Specific = Specific_number(num_empy[i], "z");
          // prnum(Specific);

          //2
          temporary = num_empy[i].split("z");
          //6,3,3
          for (var i = 0; i < Specific; i++) {
            //2번 반복
            num numbers = num.parse(temporary[i]);
            num_ssin.add(numbers);
          }

          //6,3,3
          for (var i = 0; i < Specific - 1; i++) {
            if (num_formula[i] == "*") {
              // prnum(i);
              num_ssin[0] = num_ssin[0] * num_ssin[i + 1];
              // num_ssin.removeAt(num_ssin.length-1);
            } else if (num_formula[i] == "/") {
              num_ssin[0] = num_ssin[0] / num_ssin[i + 1];
              // num_ssin.removeAt(num_ssin.length-1);
            }
          }
          // prnum(num_ssin);
          num_empy[i] = num_ssin[0].toString();
          num_ssin.clear();
        }
      }
      for (var i = 0; i < num_empy.length; i++) {
        num numbers = num.parse(num_empy[i]);
        // prnum(num_empy);
        num_ssin.add(numbers); // add를 넣어야하나?
        // prnum(num_ssin);
      }
      for (var i = 0; i < num_empy.length - 1; i++) {
        if (num_sssin[i] == "+") {
          // prnum(num_ssin);
          num_ssin[0] = num_ssin[0] + num_ssin[i + 1];
          // num_ssin.removeAt(num_ssin.length-1);
        } else if (num_sssin[i] == "-") {
          num_ssin[0] = num_ssin[0] - num_ssin[i + 1];
          // num_ssin.removeAt(num_ssin.length-1);
        }
      }

      num_empy.clear();
    });
  }

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
                  addToExpression(i.toString());
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
                num_result();
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
