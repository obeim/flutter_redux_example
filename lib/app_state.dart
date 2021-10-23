import 'models/joke.dart';

class AppState {
  final jokes;
  final bool loading;
  final List<Joke> fav;
  AppState({this.jokes, this.loading = false, this.fav});
}
