import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../widgets/joke_item.dart';

import '../app_state.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text('Fav Jokes'),
        ),
        body: ListView.builder(
          itemCount: state.fav.length,
          itemBuilder: (BuildContext context, int index) {
            var joke = state.fav[index];
            return JokeItem(
              joke: joke,
              fav: state.fav,
            );
          },
        ),
      ),
      converter: (store) => store.state,
    );
  }
}
