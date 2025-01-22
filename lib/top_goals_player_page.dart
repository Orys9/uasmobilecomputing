import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TopGoalsPlayerPage(),
    );
  }
}

class Player {
  final String name;
  final int goals;

  Player({required this.name, required this.goals});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      goals: int.parse(json['goals']),
    );
  }
}

class TopGoalsPlayerPage extends StatefulWidget {
  @override
  _TopGoalsPlayerPageState createState() => _TopGoalsPlayerPageState();
}

class _TopGoalsPlayerPageState extends State<TopGoalsPlayerPage> {
  late Future<List<Player>> players;

  @override
  void initState() {
    super.initState();
    players = fetchPlayers();
  }

  // Fetch players from API
  Future<List<Player>> fetchPlayers() async {
    final String apiUrl =
        'https://teknologi22.xyz/project_api/api_ryski/football/get_player.php';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List playerData = json.decode(response.body);
        List<Player> players = playerData.map((json) => Player.fromJson(json)).toList();

        // Urutkan pemain berdasarkan jumlah gol (terbanyak ke terkecil)
        players.sort((a, b) => b.goals.compareTo(a.goals));

        return players;
      } else {
        throw Exception('Failed to load players');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  // Add player to API
  Future<bool> addPlayerToAPI(String name, int goals) async {
    final String apiUrl =
        'https://teknologi22.xyz/project_api/api_ryski/football/add_player.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'goals': goals.toString(),
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Edit player in API
  Future<bool> editPlayerInAPI(String name, int goals) async {
    final String apiUrl =
        'https://teknologi22.xyz/project_api/api_ryski/football/edit_player.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'goals': goals.toString(),
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['message'] == "Player updated successfully";
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Delete player from API
  Future<bool> deletePlayerFromAPI(String name) async {
    final String apiUrl =
        'https://teknologi22.xyz/project_api/api_ryski/football/delete_player.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Scorer'),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade600,
      ),
      body: FutureBuilder<List<Player>>(
        future: players, // Ini akan diperbarui setelah setState()
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading data',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No players found',
                style: TextStyle(color: Colors.grey),
              ),
            );
          } else {
            // Pastikan data sudah diurutkan sebelum ditampilkan
            final sortedPlayers = snapshot.data!..sort((a, b) => b.goals.compareTo(a.goals));

            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: sortedPlayers.length,
              itemBuilder: (context, index) {
                final player = sortedPlayers[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.indigo.shade600,
                    ),
                    title: Text(
                      player.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Goals: ${player.goals}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showEditPlayerDialog(context, player),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deletePlayer(context, player),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPlayerDialog(context),
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo.shade600,
      ),
    );
  }

  // Dialog to add a new player
  void _showAddPlayerDialog(BuildContext context) {
    final nameController = TextEditingController();
    final goalsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add New Player',
            style: TextStyle(color: Colors.indigo.shade600),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Player Name'),
                ),
                TextField(
                  controller: goalsController,
                  decoration: const InputDecoration(labelText: 'Goals Scored'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final goals = int.tryParse(goalsController.text.trim());

                if (name.isEmpty || goals == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All fields must be filled'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                bool success = await addPlayerToAPI(name, goals);
                if (success) {
                  setState(() {
                    players = fetchPlayers(); // Refresh the player list
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Player successfully added!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to add player'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.indigo.shade600),
              ),
            ),
          ],
        );
      },
    );
  }

  // Dialog to edit a player
  void _showEditPlayerDialog(BuildContext context, Player player) {
    final nameController = TextEditingController(text: player.name);
    final goalsController = TextEditingController(text: player.goals.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Edit Player',
            style: TextStyle(color: Colors.indigo.shade600),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Player Name'),
                ),
                TextField(
                  controller: goalsController,
                  decoration: const InputDecoration(labelText: 'Goals Scored'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final goals = int.tryParse(goalsController.text.trim());

                if (name.isEmpty || goals == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All fields must be filled'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                bool success = await editPlayerInAPI(name, goals);
                if (success) {
                  setState(() {
                    players = fetchPlayers(); // Refresh the player list
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Player successfully updated!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to update player'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.indigo.shade600),
              ),
            ),
          ],
        );
      },
    );
  }

  // Delete a player
  void _deletePlayer(BuildContext context, Player player) async {
    bool success = await deletePlayerFromAPI(player.name);
    if (success) {
      setState(() {
        players = fetchPlayers(); // Refresh the player list
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Player successfully deleted!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete player'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}