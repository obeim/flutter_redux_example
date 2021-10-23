import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../actions.dart';
import '../app_state.dart';

class JokeItem extends StatelessWidget {
  final joke;
  final fav;
  JokeItem({this.joke, this.fav});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.purple)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Stack(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      joke.setup,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      joke.punchline,
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: fav.firstWhere((item) => item.id == joke.id,
                              orElse: () => null) !=
                          null
                      ? Colors.red
                      : Colors.grey[300],
                ),
                onPressed: () {
                  if (fav.firstWhere((item) => item.id == joke.id,
                          orElse: () => null) !=
                      null) {
                    StoreProvider.of<AppState>(context)
                        .dispatch(RemoveFav(joke));
                  } else {
                    StoreProvider.of<AppState>(context).dispatch(AddFav(joke));
                  }
                })
          ]),
        ],
      ),
    );
  }
}
