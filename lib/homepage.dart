import 'package:flutter/material.dart';
import 'english_league_page.dart';
import 'italian_league_page.dart';
import 'spanish_league_page.dart';
import 'german_league_page.dart';
import 'profile.dart';
import 'match_detail.dart';
import 'top_goals_player_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Sports'),
        backgroundColor: Colors.indigo.shade600,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigo.shade200, Colors.indigo.shade700],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade600,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sports_soccer,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Football Sports',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage(username: username)),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.white),
                      title: Text(
                        'Matchs',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MatchDetailPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.emoji_events, color: Colors.white),
                      title: Text(
                        'Top Scorer',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TopGoalsPlayerPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_soccer, color: Colors.white),
                      title: Text(
                        'Premiere League',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EnglishLeaguePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_soccer, color: Colors.white),
                      title: Text(
                        'Serie A',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ItalianLeaguePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_soccer, color: Colors.white),
                      title: Text(
                        'La Liga',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SpanishLeaguePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_soccer, color: Colors.white),
                      title: Text(
                        'Bundesliga',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GermanLeaguePage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stadion.jpg'), // Gambar latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon bola berputar
              RotationTransition(
                turns: AlwaysStoppedAnimation(15 / 360),
                child: Icon(
                  Icons.sports_soccer,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Teks Selamat Datang dengan efek shadow
              Text(
                'Selamat Datang, $username!',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Teks tambahan dengan efek shadow
              Text(
                'Jelajahi dunia sepak bola bersama kami',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Tombol CTA
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchDetailPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade600,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Lihat Jadwal Pertandingan',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}