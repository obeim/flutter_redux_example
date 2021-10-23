import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import './screens/home_screen.dart';
import 'app_reducer.dart';
import 'app_state.dart';

void main() {
  final Store<AppState> _store = Store<AppState>(
    appReducer, // reducer is a function used to change state according to action
    initialState: AppState(loading: false, jokes: [], fav: []),

    /// appState is model to define what we want in our global state u can name it anything
    middleware: [
      thunkMiddleware
    ], // middleware is a function that get executed before action ,it not neccessry ,but its helpful for async requests
  );
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: HomeScreen(),
      ),
    ); // StoreProivder used to provide global state for all children , then u can use the state inside them or dispatch an action  with StoreConnecter
  }
}
