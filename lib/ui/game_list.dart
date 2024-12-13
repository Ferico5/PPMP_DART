import 'package:flutter/material.dart';
import 'package:latihan_api_demo/ui/game_create_page.dart';

class GameList extends StatefulWidget {
  const GameList({super.key});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => GameCreatePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
