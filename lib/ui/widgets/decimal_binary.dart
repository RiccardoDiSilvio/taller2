import 'package:flutter/material.dart';

class DecimalToBinary extends StatefulWidget {
  DecimalToBinary({Key? key}) : super(key: key);

  @override
  State<DecimalToBinary> createState() => _DecimalToBinaryState();
}

class _DecimalToBinaryState extends State<DecimalToBinary> {
  String _binary = "0";
  String _decimal = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        Expanded(
            flex: 3,
            child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '$_decimal',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                      fontSize: 50),
                ))),
        Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.centerRight,
                child: Text("$_binary",
                    style: new TextStyle(
                      fontSize: 35,
                      color: Colors.red,
                    )))),
        Expanded(
            flex: 15,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: decimalKeyNumber(9)),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Expanded(child: decimalKeyNumber(8)),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Expanded(child: decimalKeyNumber(7)),
                    ],
                  )),
                  Padding(padding: const EdgeInsets.all(2.0)),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: decimalKeyNumber(6)),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Expanded(child: decimalKeyNumber(5)),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Expanded(child: decimalKeyNumber(4)),
                    ],
                  )),
                  Padding(padding: const EdgeInsets.all(2.0)),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: decimalKeyNumber(3)),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Expanded(child: decimalKeyNumber(2)),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Expanded(child: decimalKeyNumber(1)),
                    ],
                  )),
                  Padding(padding: const EdgeInsets.all(2.0)),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: decimalKeyNumber(0)),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Expanded(
                        child: Container(
                          child: MaterialButton(
                              color: Color(
                                  int.parse("#0069C0".replaceAll('#', '0xff'))),
                              onPressed: () {
                                setState(() {
                                  _binary = "0";
                                  _decimal = "0";
                                });
                              },
                              child: Text("Reset",
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ))),
                        ),
                      )
                    ],
                  ))
                ])),
      ]),
    );
  }

  Widget decimalKeyNumber(number) {
    return MaterialButton(
      color: Color(int.parse("#2FE058".replaceAll('#', '0xff'))),
      child: Text(number.toString()),
      onPressed: () {
        setState(() {
          if (_decimal == "0") {
            _decimal = number.toString();
          } else {
            _decimal = _decimal + number.toString();
          }
          _binary = int.parse(_decimal, radix: 10).toRadixString(2);
        });
      },
    );
  }
}
