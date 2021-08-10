import 'package:flutter/material.dart';
import 'package:flute/flute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(_) => FluteMaterialApp(routes: {
        '/': (ctx) => FirstPage(),
        '/second/:id': (ctx) => SecondPage(),
        '/third': (ctx) => ThirdPage()
      });
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(_) => Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('First Page'),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () => Flute.pushNamed(

                /// You can add any kind of arguments
                '/second/33?name=Rago&postId=123&isMaterial=true',
                arguments: 'This is an extra argument'),
            child: const Text('Go to second page'))
      ])));
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Flute.arguments);

    /// You can see the arguments
    return Scaffold(
        appBar: AppBar(title: const Text('Second Page')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Second Page'),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Flute.pushNamed('/third', arguments: 'hey'),
              child: const Text('Go to third page'))
        ])));
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(_) {
    print(Flute.arguments);
    return Scaffold(
        appBar: AppBar(title: const Text('Third Page')),
        body: Center(child: Container(child: const Text('Third Page'))));
  }
}
