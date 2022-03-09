import 'package:flutter/material.dart';

import '../widgets/binary_decimal.dart';
import '../widgets/decimal_binary.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "Binary -> Decimal";
  Widget child = BinaryToDecimal();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Converter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Converter'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerLeft, child: Text(title))),
                Expanded(flex: 10, child: Container(child: child)),
                Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                          height: double.infinity,
                          minWidth: double.infinity,
                          color: Color(
                              int.parse("#0069C0".replaceAll('#', '0xff'))),
                          onPressed: () {
                            setState(() {
                              if (title == "Binary -> Decimal") {
                                title = "Decimal -> Binary";
                                child = DecimalBinary();
                              } else if (title == "Decimal -> Binary") {
                                title = "Binary -> Decimal";
                                child = BinaryToDecimal();
                              }
                            });
                          },
                          child: Text("Switch",
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ))),
                    ))
              ],
            )));
  }
}
