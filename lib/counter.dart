import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// header
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

// body
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _type = "偶数";
  int _type_color = Color(0xffff0000).value;

  void _incrementConter() {
    setState(() {
      _counter++;

      if (_counter % 2 == 0) {
        _type = "偶数";
        _type_color = Color(0xffff0000).value;
      } else {
        _type = "奇数";
        _type_color = Color(0xff0000ff).value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // header
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),

      // body
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("You have pushed the button this many times !"),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text('$_type', style: TextStyle(fontSize: 20, color: Colors.green))
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementConter,
          tooltip: 'Increment',
          child: const Icon(Icons.add)),
    );
  }
}
