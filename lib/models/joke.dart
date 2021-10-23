class Joke {
  final id;
  final type;
  final setup;
  final punchline;
  Joke({this.id, this.punchline, this.setup, this.type});

  Joke.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.type = json['type'],
        this.punchline = json['punchline'],
        this.setup = json['setup'];
}
