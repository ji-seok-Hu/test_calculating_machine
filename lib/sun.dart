import 'main.dart';

List<String> num_list = [""];
List<String> num_sign = [];
List<String> num_empy = []; //선,곱나나
List<String> num_formula = []; //후,플마
List<num> num_ssin = [0];
List<String> num_sssin = [];

void addToExpression(String value) {
 num_list.add(value);
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
}
