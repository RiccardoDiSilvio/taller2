import 'package:flutter/material.dart';

class BinaryToDecimal extends StatefulWidget {
  @override
  _BinaryToDecimalState createState() => _BinaryToDecimalState();
}

class _BinaryToDecimalState extends State<BinaryToDecimal> {
  String _binary = "0";
  String _decimal = "0";

  void _onPressed() {}

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
                  '$_binary',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                      fontSize: 35),
                )),
            Expanded(
                child: Text("$_decimal",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ))),
            Expanded(
                child: Row(children: <Widget>[
              Expanded(child: binaryKeyNumber(1)),
              Expanded(child: binaryKeyNumber(0)),
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

  Widget binaryKeyNumber(number) {
    return MaterialButton(
      child: Text(number.toString()),
      onPressed: () {
        setState(() {
          if (_binary == "0") {
            _binary = number.toString();
          } else {
            _binary = _binary + number.toString();
          }
          _decimal = int.parse(_binary, radix: 2).toRadixString(10);
        });
      },
    );
  }
}
