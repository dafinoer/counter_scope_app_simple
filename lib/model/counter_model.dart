import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class CounterModels extends Model {

  int _counter = 0;

  int get counterSize => _counter;

  void increment(){
    _counter +=1;
    notifyListeners();
  }

  static CounterModels of(BuildContext context){
    ScopedModel.of<CounterModels>(context);
  }
}