
import 'package:cubit_authgoogle/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => CounterCubit(55), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter app cubit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
              if (state is CounterInitial) {
                return buildValue(state.value, context);
              } else if (state is CounterIncrement) {
                return buildValue(state.value, context);
              }
              else if (state is CounterDecrement){
                return buildValue(state.value, context);
              }
              throw UnimplementedError();
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              final counterCubit = BlocProvider.of<CounterCubit>(context);
              counterCubit.incrementValue();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              final counterCubit = BlocProvider.of<CounterCubit>(context);
              counterCubit.decrementValue();
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  Widget buildValue(int value, BuildContext context) {
    return Text(
      value.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}