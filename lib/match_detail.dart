import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatchDetailPage(),
    );
  }
}

class Match {
  final String team1;
  final String team2;
  final String league;
  final String date;
  final String time;

  Match({required this.team1, required this.team2, required this.league, required this.date, required this.time});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      team1: json['team1'],
      team2: json['team2'],
      league: json['league'],
      date: json['date'],
      time: json['time'],
    );
  }
}

class MatchDetailPage extends StatefulWidget {
  @override
  _MatchDetailPageState createState() => _MatchDetailPageState();
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  late Future<List<Match>> matches;

  @override
  void initState() {
    super.initState();
    matches = fetchMatches();
  }

  Future<List<Match>> fetchMatches() async {
    final String apiUrl = 'https://teknologi22.xyz/project_api/api_ryski/football/get_match.php';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List matches = json.decode(response.body);
        List<Match> matchList = matches.map((json) => Match.fromJson(json)).toList();

        // Urutkan pertandingan berdasarkan tanggal
        matchList.sort((a, b) => _parseDate(a.date).compareTo(_parseDate(b.date)));

        return matchList;
      } else {
        throw Exception('Gagal memuat data pertandingan');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  // Fungsi untuk mengubah format waktu menjadi "21.00" atau "23.30"
  String _formatTime(String time) {
    try {
      final timeParts = time.split(':');
      if (timeParts.length >= 2) {
        return '${timeParts[0]}.${timeParts[1]}'; // Ambil jam dan menit
      }
      return time; // Jika format tidak sesuai, kembalikan waktu asli
    } catch (e) {
      print('Error formatting time: $e');
      return time;
    }
  }

  // Fungsi untuk mengubah string tanggal menjadi objek DateTime
  DateTime _parseDate(String date) {
    return DateTime.parse(date);
  }

  Future<bool> _addMatchToAPI(String team1, String team2, String league, String date, String time) async {
    final String apiUrl = 'https://teknologi22.xyz/project_api/api_ryski/football/add_match.php';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'team1': team1,
        'team2': team2,
        'league': league,
        'date': date,
        'time': time,
      }),
    );

    return response.statusCode == 200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Pertandingan'),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
      ),
      body: FutureBuilder<List<Match>>(
        future: matches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data', style: TextStyle(color: Colors.red)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No matches found', style: TextStyle(color: Colors.grey)));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final match = snapshot.data![index];
                final formattedTime = _formatTime(match.time); // Format waktu

                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          match.league,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo.shade700),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              match.team1,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'VS',
                              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                            ),
                            SizedBox(width: 10),
                            Text(
                              match.team2,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: Text(
                            '${match.date}, $formattedTime WIB', // Gunakan formattedTime
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                          ),
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
        onPressed: () => _showAddMatchDialog(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo.shade700,
      ),
    );
  }

  void _showAddMatchDialog(BuildContext context) {
    final team1Controller = TextEditingController();
    final team2Controller = TextEditingController();
    final leagueController = TextEditingController();
    final dateController = TextEditingController();
    final timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Pertandingan', style: TextStyle(color: Colors.indigo.shade700)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: team1Controller, decoration: InputDecoration(labelText: 'Tim 1', labelStyle: TextStyle(color: Colors.indigo.shade700))),
                TextField(controller: team2Controller, decoration: InputDecoration(labelText: 'Tim 2', labelStyle: TextStyle(color: Colors.indigo.shade700))),
                TextField(controller: leagueController, decoration: InputDecoration(labelText: 'Liga', labelStyle: TextStyle(color: Colors.indigo.shade700))),
                TextField(controller: dateController, decoration: InputDecoration(labelText: 'Tanggal (YYYY-MM-DD)', labelStyle: TextStyle(color: Colors.indigo.shade700))),
                TextField(controller: timeController, decoration: InputDecoration(labelText: 'Waktu (HH:MM:SS)', labelStyle: TextStyle(color: Colors.indigo.shade700))),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Batal', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                final team1 = team1Controller.text.trim();
                final team2 = team2Controller.text.trim();
                final league = leagueController.text.trim();
                final date = dateController.text.trim();
                final time = timeController.text.trim();

                if (team1.isEmpty || team2.isEmpty || league.isEmpty || date.isEmpty || time.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Semua field harus diisi'), backgroundColor: Colors.red),
                  );
                  return;
                }

                if (team1 == team2) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tim 1 dan Tim 2 tidak boleh sama'), backgroundColor: Colors.red),
                  );
                  return;
                }

                bool success = await _addMatchToAPI(team1, team2, league, date, time);
                if (success) {
                  setState(() {
                    matches = fetchMatches(); // Refresh daftar pertandingan
                  });
                  Navigator.of(context).pop(); // Tutup dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Pertandingan berhasil ditambahkan!'), backgroundColor: Colors.green),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gagal menambahkan pertandingan'), backgroundColor: Colors.red),
                  );
                }
              },
              child: Text('Simpan', style: TextStyle(color: Colors.indigo.shade700)),
            ),
          ],
        );
      },
    );
  }
}