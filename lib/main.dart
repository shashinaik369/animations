import 'dart:math' show pi;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: AnimationsHub(),
    );
  }
}

class AnimationsHub extends StatefulWidget {
  const AnimationsHub({super.key});

  @override
  State<AnimationsHub> createState() => _AnimationsHubState();
}

class _AnimationsHubState extends State<AnimationsHub>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6));

    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: ((context, child) {
            return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(_animation.value),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                    ),
                  ]),
                  child: Image(image: NetworkImage('https://yt3.ggpht.com/igUmHw7bp6SFHAIQhy3ej_WnAf5ObJ8jO45ZpmvCSXjkyyxwiEOGg4fcN9MXLsbWMMtG2vbQ=s108-c-k-c0x00ffffff-no-rj'),
                  fit: BoxFit.fill,),
            ),
          );
          }),
         
        ),
      ),
    );
  }
}
