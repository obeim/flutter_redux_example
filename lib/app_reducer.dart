import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'actions.dart';
import 'app_state.dart';
import 'models/joke.dart';

AppState appReducer(AppState prevState, dynamic action) {
  if (action is JokesRequest) {
    return AppState(loading: true, jokes: [], fav: prevState.fav);
  }
  if (action is JokesSuccess) {
    return AppState(loading: false, jokes: action.payload, fav: prevState.fav);
  }
  if (action is AddFav) {
    return AppState(
        jokes: prevState.jokes,
        loading: prevState.loading,
        fav: [...prevState.fav, action.payload]);
  }
  if (action is RemoveFav) {
    return AppState(
        jokes: prevState.jokes,
        loading: prevState.loading,
        fav: prevState.fav
            .where((element) => element.id != action.payload.id)
            .toList());
  }
  return prevState;
}

ThunkAction<AppState> getJokes() {
  return (Store<AppState> store) async {
    store.dispatch(JokesRequest());
    try {
      final res = await http
          .get(Uri.parse('https://official-joke-api.appspot.com/random_ten'));
      // get(Uri.parse('http://192.168.43.121:4000/'));
      var jsonMapArr = jsonDecode(res.body);
      var jokesObArr = jsonMapArr.map((map) => new Joke.fromJson(map)).toList();
      store.dispatch(JokesSuccess(jokesObArr));
    } catch (err) {}
  };
} // example for thunk middleware
