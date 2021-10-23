class JokesRequest {}

class JokesSuccess {
  final payload;
  JokesSuccess(this.payload);
}

class JokesFalied {
  final payload;
  JokesFalied(this.payload);
}

class AddFav {
  final payload;
  AddFav(this.payload);
}

class RemoveFav {
  final payload;
  RemoveFav(this.payload);
}
