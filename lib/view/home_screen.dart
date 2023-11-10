import 'package:calcsi/data/button_data.dart';
import 'package:calcsi/res/colors.dart';
import 'package:calcsi/res/components/button.dart';
import 'package:calcsi/res/dimensions.dart';
import 'package:calcsi/view_model/services/calculation_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool clearCalculation = false;
  ButtonData buttonValues = ButtonData();
  List<Map<String, dynamic>> list = [];
  String input = '';
  String output = '';
  void initState() {
    super.initState();
    list = buttonValues.buttonData();
  }

  void _calculateResult() {
    try {
      // Evaluate the expression
      output = CalculationService.calculate(input).toString();
    } catch (e) {
      output = 'Error';
    }
  }

  void clearFunc() async {
    if (input.isNotEmpty) {
      for (int i = input.length; i >= 0; i--) {
        await Future.delayed(Duration(milliseconds: 10), () {
          setState(() {
            input = input.substring(0, i);
          });
        });
      }
    }

    if (output.isNotEmpty) {
      for (int i = output.length; i >= 0; i--) {
        await Future.delayed(Duration(milliseconds: 10), () {
          setState(() {
            output = output.substring(0, i);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        left: false,
        right: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // for history and theme

            Container(
              height: _height * .05,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      // color: list['color'],
                      color: AppColor.btnbgcolor,
                      offset: AppDimension.offset,
                      blurRadius: AppDimension.blur,
                    ),
                    BoxShadow(
                      color: AppColor.white,
                      offset: -AppDimension.offset,
                      blurRadius: AppDimension.blur,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(AppDimension.containerradius)),
              margin: EdgeInsets.symmetric(
                  horizontal: _height * .015, vertical: _height * .01),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.history_rounded,
                        size: _height * .04,
                      )),
                  SizedBox(
                    width: _height * .001,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.dark_mode_rounded,
                        size: _height * .04,
                        color: AppColor.btnbgcolor,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: _height * .08,
            ),

            //for input
            Container(
              padding: EdgeInsets.symmetric(horizontal: _height * .04),
              alignment: Alignment.centerLeft,
              child: RichText(
                  text: TextSpan(
                      text: input,
                      style: TextStyle(
                          fontSize: _height * .04,
                          color: AppColor.btnbgcolor))),
            ),
            // for output
            Container(
              padding: EdgeInsets.symmetric(horizontal: _height * .04),
              alignment: Alignment.centerRight,
              child: RichText(
                  text: TextSpan(
                      text: output,
                      style: TextStyle(
                          fontSize: _height * .04,
                          color: AppColor.btnbgcolor))),
            ),
            SizedBox(
              height: _height * .08,
            ),
            //button grid with ontap
            buttonView(_height, _width)
          ],
        ),
      ),
    );
  }

  Container buttonView(double _height, double _width) {
    return Container(
      height: _height * .46,
      padding: EdgeInsets.symmetric(
          horizontal: _height * .01, vertical: _height * .01),
      child: SafeArea(
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: _height * .010,
                mainAxisSpacing: _height * .010,
                childAspectRatio:
                    (_height > _width) ? _height * .0017 : _width * .009,
                crossAxisCount: 4),
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () {
                    if (index == 0)
                      clearFunc();
                    else if (index == 1) {
                      (input.isNotEmpty)
                          ? setState(() {
                              input = input.substring(0, input.length - 1);
                            })
                          : setState(() {
                              input = '';
                            });
                    } else if (index == list.length - 1)
                      setState(() {
                        setState(() {
                          clearCalculation = true;
                        });
                        _calculateResult();
                      });
                    else
                      setState(() {
                        if (!clearCalculation) {
                          (index == 2 ||
                                  index == 3 ||
                                  index == 7 ||
                                  index == 11 ||
                                  index == 15 ||
                                  index == 18)
                              ? input += ' ' + list[index]['data'] + ' '
                              : input += list[index]['data'];
                        } else {
                          // these lines of code handles the calculation when a new operand is entered after pervious calculaton but the user hasn't cleared the screen
                          clearCalculation = false;
                          input = "";
                          output = "";
                          (index == 2 ||
                                  index == 3 ||
                                  index == 7 ||
                                  index == 11 ||
                                  index == 15 ||
                                  index == 18)
                              ? input += ' ' + list[index]['data'] + ' '
                              : input += list[index]['data'];
                          setState(() {});
                        }
                      });
                  },
                  child: RoundedButton(
                    list: list[index],
                  ),
                ))),
      ),
    );
  }
}
