import 'package:flutter/material.dart';
import 'package:latihan_api_demo/repository/game_repository.dart';
import 'package:latihan_api_demo/response/game_params_response.dart';
import 'package:latihan_api_demo/params/game_param.dart';

class GameCreatePage extends StatefulWidget {
  const GameCreatePage({super.key});

  @override
  State<GameCreatePage> createState() => _GameCreatePageState();
}

class _GameCreatePageState extends State<GameCreatePage> {
  final gameRepository = GameRepository();
  late Future<GameCreateResponse> futureGame;

  @override
  void initState() {
    super.initState();
    // Initialize the future that will fetch the game data
    futureGame = gameRepository.addGame(GameParam(name: 'Game Z2', price: '3000.00'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Create Page'),
      ),
      body: FutureBuilder<GameCreateResponse>(
        future: futureGame, // The future that gets the game data
        builder: (context, snapshot) {
          // Check if the future is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Check for errors
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Check if the snapshot has data
          else if (snapshot.hasData) {
            GameCreateResponse gameData = snapshot.data!; // Get the game data

            // Display the game data
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Game ID: ${gameData.id}', style: TextStyle(fontSize: 18)),
                  Text('Game Name: ${gameData.name}', style: TextStyle(fontSize: 18)),
                  Text('Game Price: ${gameData.price}', style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
