import 'package:flutter/material.dart';
import 'club_detail_page.dart';

class EnglishLeaguePage extends StatelessWidget {
  // Daftar klub Liga Inggris dengan nama dan nama file logo di assets/logos
  final List<Map<String, String>> clubs = [
    {
      'name': 'Manchester United',
      'logo': 'assets/logos/manutd.png'
    },
    {
      'name': 'Liverpool',
      'logo': 'assets/logos/liverpool.png'
    },
    {
      'name': 'Chelsea',
      'logo': 'assets/logos/chelseal.png'
    },
    {
      'name': 'Arsenal',
      'logo': 'assets/logos/arsenal.png'
    },
    {
      'name': 'Manchester City',
      'logo': 'assets/logos/mancity.png'
    },
    {
      'name': 'Tottenham Hotspur',
      'logo': 'assets/logos/tot.png'
    },
    {
      'name': 'Leicester City',
      'logo': 'assets/logos/lei.png'
    },
    {
      'name': 'Everton',
      'logo': 'assets/logos/eve.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premiere League'),
        backgroundColor: Colors.indigo.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: clubs.length,
          itemBuilder: (context, index) {
            final club = clubs[index];
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail klub
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClubDetailPage(
                      clubName: club['name']!,
                      logoUrl: club['logo']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      club['logo']!,
                      width: 80,
                      height: 80,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error, size: 80, color: Colors.red);
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      club['name']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}