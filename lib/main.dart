import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// class MyApp
class MyApp extends StatelessWidget {
  /// Parent key inheritance
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// class MyHomePage
class MyHomePage extends StatefulWidget {

  /// Parent key inheritance
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _text = 'Hey there';
  static const int max = 255;
  // Get alpha, red, green and blue values from current time
  Color _color = Color.fromARGB(
      DateTime.now().millisecond % max,
      DateTime.now().millisecondsSinceEpoch % max,
      DateTime.now().microsecondsSinceEpoch % max,
      (DateTime.now().microsecondsSinceEpoch - DateTime.now().millisecond)%max,
  );

  void _changeBackground() {
    // Get alpha, red, green and blue values from current time
    setState(() => _color = Color.fromARGB(
      DateTime.now().millisecond % max,
      DateTime.now().millisecondsSinceEpoch % max,
      DateTime.now().microsecondsSinceEpoch % max,
      (DateTime.now().microsecondsSinceEpoch - DateTime.now().millisecond)%max,
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Ink(
        child: InkWell(
          onTap: _changeBackground,
          child: Container(
            color: _color,
            child: Center(
              child: Column (
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(_text),
                   const Padding(padding: EdgeInsets.only(bottom: 15),),
                   Text('Opacity: ${_color.alpha}'),
                   Text('Red: ${_color.red}'),
                   Text('Green: ${_color.green}'),
                   Text('Blue: ${_color.blue}'),
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
