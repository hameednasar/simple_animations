import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedContainerDemo(),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _isAnimated = false;
  bool _isTextVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple animations implicit'), // Fixed text title
      ),
      body: Center(
        // Center the entire content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lab 05',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _isAnimated ? 200.0 : 100.0,
              height: _isAnimated ? 200.0 : 100.0,
              decoration: BoxDecoration(
                color: _isAnimated ? Colors.green : Colors.yellow,
                borderRadius: BorderRadius.circular(_isAnimated ? 50.0 : 0.0),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAnimated = !_isAnimated;
                });
              },
              child: Text('Animate Container'),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _isTextVisible ? 1.0 : 0.0,
              child: Text('This is a fading text!'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isTextVisible = !_isTextVisible;
                });
              },
              child: Text('Toggle Text Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
