import 'package:calculator/components/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xffF6CD61)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Align(
                          alignment: Alignment.bottomRight,
                        ),
                        Text(
                          userInput.toString(),
                          style: GoogleFonts.crimsonPro(
                              fontSize: 30, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          answer.toString(),
                          style: GoogleFonts.crimsonPro(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: "AC",
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "*/-",
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "%",
                          onPress: () {
                            userInput = '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "/",
                          color: const Color(0xffFE8A71),
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "7",
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "8",
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "0",
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "x",
                          color: const Color(0xffFE8A71),
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "4",
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "5",
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "6",
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "-",
                          color: const Color(0xffFE8A71),
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "1",
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "2",
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "3",
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "+",
                          color: const Color(0xffFE8A71),
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "0",
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: ".",
                          onPress: () {
                            if (userInput.substring(
                                    userInput.length - 1, userInput.length) !=
                                '.') {
                              userInput += '.';
                            }

                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "DEL",
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "=",
                          color: const Color(0xffFE8A71),
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    // ignore: unused_local_variable
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
