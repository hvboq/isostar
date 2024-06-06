import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  TextStyle textStyle1 = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이소스타',
          style: textStyle1,
        ),
        actions: <Widget>[Icon(Icons.add_box_outlined)],
        elevation: 1,
      ),
      body: Center(
        child: Text('이소스타'),
      ),
    );
  }
}
