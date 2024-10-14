import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_consumer/second_page.dart';

import 'counter_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("this build function is called");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(builder: (ctx, provider, _) {
              print("consumer build function is called");
              return Text(
                '${Provider.of<CounterProvider>(ctx).getCountValue()}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),

            /* Text(
              '${Provider.of<CounterProvider>(context).getCountValue()}',
              style: Theme.of(context).textTheme.headlineMedium,*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ));

          /* Provider.of<CounterProvider>(context,listen: false).incrementCount();*/
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
