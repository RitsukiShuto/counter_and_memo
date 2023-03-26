import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Counter and Memo Application',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Number Counter',
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
  String _choice = '0';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      // header
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        title: Text(
          widget.title,
          style: GoogleFonts.vt323(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),

      // body
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ラジオボタン
          SizedBox(
            height: displayHeight * 0.1,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("mode A",
                          style: GoogleFonts.notoSansJavanese(
                            color: Colors.white,
                          )),
                      Text("mode B",
                          style: GoogleFonts.notoSansJavanese(
                            color: Colors.white,
                          )),
                      Text("mode C",
                          style: GoogleFonts.notoSansJavanese(
                            color: Colors.white,
                          )),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(
                        activeColor: Colors.white,
                        value: '0',
                        groupValue: _choice,
                        onChanged: (value) {
                          // ラジオボタンの値を変更
                          setState(() {
                            _choice = value.toString();
                          });
                        }),
                    Radio(
                        activeColor: Colors.white,
                        value: '1',
                        groupValue: _choice,
                        onChanged: (value) {
                          setState(() {
                            _choice = value.toString();
                          });
                        }),
                    Radio(
                        activeColor: Colors.white,
                        value: '2',
                        groupValue: _choice,
                        onChanged: (value) {
                          setState(() {
                            _choice = value.toString();
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),

          // 数字
          SizedBox(
            height: displayHeight * 0.2,
            child: Text('$_counter',
                style: GoogleFonts.dotGothic16(
                  fontSize: 80,
                  color: Colors.white,
                ) // フォントと色を変える
                ),
          ),

          // ボタン
          SizedBox(
            height: displayHeight * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(
                    Icons.exposure_minus_1,
                    color: Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
