import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FlutterReduxApp extends StatefulWidget {
  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();
}

// One simple action: Increment
enum Actions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}

class _FlutterReduxAppState extends State<FlutterReduxApp>
    with NavigatorObserver {
  final store = new Store<int>(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
