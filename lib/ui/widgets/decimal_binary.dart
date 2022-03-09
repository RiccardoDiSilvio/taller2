import 'package:flutter/material.dart';

class DecimalBinary extends StatefulWidget {
  DecimalBinary({Key? key}) : super(key: key);

  @override
  State<DecimalBinary> createState() => _DecimalBinaryState();
}

class _DecimalBinaryState extends State<DecimalBinary> {
  String _binary = "0";
  String _decimal = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '$_decimal',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                      fontSize: 35),
                )),
            Expanded(
                child: Text("$_binary",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ))),
            Expanded(
                child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: decimalKeyNumber(9)),
                  Expanded(child: decimalKeyNumber(8)),
                  Expanded(child: decimalKeyNumber(7)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: decimalKeyNumber(6)),
                  Expanded(child: decimalKeyNumber(5)),
                  Expanded(child: decimalKeyNumber(4)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: decimalKeyNumber(3)),
                  Expanded(child: decimalKeyNumber(2)),
                  Expanded(child: decimalKeyNumber(1)),
                ],
              )
            ])),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Color(int.parse("#0069C0".replaceAll('#', '0xff'))),
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
            ),
          ]),
    );
  }

  Widget decimalKeyNumber(number) {
    return MaterialButton(
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
