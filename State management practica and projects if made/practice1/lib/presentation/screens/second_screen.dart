import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/cubit/counter_cubit.dart';

class Second_screen extends StatefulWidget {

  final String title;
  final Color color;

  const Second_screen({super.key, required this.title,required this.color});


  @override
  State<Second_screen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Second_screen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You pushd button these many times"),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if(state.is_incremented){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Incremented"),
                        duration: Duration(milliseconds: 100),
                      )
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Decremented"))
                  );
                }
              },
              builder: (context, state) {
                if (state.counter_value < 0)
                  return Text("It's NEGATIVE ${state.counter_value}",
                      style: TextStyle(fontSize: 20));
                else
                  return Text(" ${state.counter_value}",
                      style: TextStyle(fontSize: 20));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'increment',
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'decrement',
                    child: Icon(Icons.remove)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
