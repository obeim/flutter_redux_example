import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../widgets/joke_item.dart';

import '../app_reducer.dart';
import '../app_state.dart';
import 'fav_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(getJokes());
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FavScreen()));
              })
        ],
        elevation: 0,
        backgroundColor: Colors.purple[300],
        title: Text('Jokes'),
      ),
      body: StoreConnector<AppState, AppState>(
          onInit: (Store<AppState> store) {
            store.dispatch(getJokes());
          },
          builder: (context, state) {
            return state.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (state.jokes.length > 0
                    ? ListView.builder(
                        itemCount: state.jokes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return JokeItem(
                            joke: state.jokes[index],
                            fav: state.fav,
                          );
                        },
                      )
                    : Center(child: Text('there is no jokes')));
          },
          converter: (store) => store.state),
    );
  }
}
