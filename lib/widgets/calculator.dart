import 'package:flutter/material.dart';
import 'package:calculatorv2/providers/calcul_provider.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  dynamic displaytxt = 20;

  @override
  Widget build(BuildContext context) {
    var calcul = Provider.of<Calcul>(context);

    Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
      // var calcul = Provider.of<Calcul>(context);
      return Container(
          child:
              // ignore: deprecated_member_use
              RaisedButton(
        child: Text(
          "${btntxt}",
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        onPressed: () {
          calcul.changeValue('$btntxt');
        },
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ));
    }

    //Calculator
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Calculator display
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    // shrinkWrap: true,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '${calcul.text}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          calcbutton('AC', Colors.grey, Colors.black),
                          calcbutton('+/-', Colors.grey, Colors.black),
                          calcbutton('%', Colors.grey, Colors.black),
                          calcbutton('/', Colors.orange, Colors.white),
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            calcbutton('7', Colors.grey, Colors.white),
                            calcbutton('8', Colors.grey, Colors.white),
                            calcbutton('9', Colors.grey, Colors.white),
                            calcbutton('x', Colors.orange, Colors.white),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          calcbutton('4', Colors.grey, Colors.white),
                          calcbutton('5', Colors.grey, Colors.white),
                          calcbutton('6', Colors.grey, Colors.white),
                          calcbutton('-', Colors.orange, Colors.white),
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            calcbutton('1', Colors.grey, Colors.white),
                            calcbutton('2', Colors.grey, Colors.white),
                            calcbutton('3', Colors.grey, Colors.white),
                            calcbutton('+', Colors.orange, Colors.white),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //this is button Zero
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                              onPressed: () {
                                calcul.changeValue('0');
                              },
                              shape: StadiumBorder(),
                              child: Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              ),
                              color: Colors.grey[850],
                            ),
                            calcbutton('.', Colors.grey, Colors.white),
                            calcbutton('=', Colors.orange, Colors.white),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
