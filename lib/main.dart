import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:counter_scoped_app_simple/model/counter_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final CounterModels models = CounterModels();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<CounterModels>(
        model: models,
        child: CounterApp(title: 'counter apps',),
      )
    );
  }
}

/*
Gunaakan ScopeModel jika ingin mengirim data dari parent ke child bawahnya yang nantinya
akan dikenali oleh descendant Widget
*/

class CounterApp extends StatelessWidget {

  CounterApp({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child:Text('Simple ScopeModel', style: Theme.of(context).textTheme.display1,)),
            ScopedModelDescendant<CounterModels>(
              builder: (_, widget, models)=> Text(models.counterSize.toString(),
              style: Theme.of(context).textTheme.display1)
            )
          ],
        ),
      ),

      floatingActionButton: ScopedModelDescendant<CounterModels>(
        builder: (context, widget, models)=> FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>models.increment(),),
      ),
    );
  }
}

class Action extends StatelessWidget {

  Action({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:ScopedModelDescendant<CounterModels>(
        builder: (context, widget, models)=>
        Text(models.counterSize.toString(),
        style: TextStyle(fontSize: 24.0)),)
    );
  }
}