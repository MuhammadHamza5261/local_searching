import 'package:flutter/material.dart';
import 'package:flutterweb/example.dart';
import 'package:flutterweb/example2.dart';
import 'package:flutterweb/example4.dart';
import 'package:flutterweb/firstweb.dart';
import 'package:flutterweb/list_create_dynamic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main.dart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FirstWebSTL()));
            },
            child: const Text('Click me'),
        ),

      // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}