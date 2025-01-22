import 'package:flutter/material.dart';
import 'club_detail_page.dart';

class SpanishLeaguePage extends StatelessWidget {
  // Daftar klub Liga Spanyol dengan nama dan nama file logo di assets/logos
  final List<Map<String, String>> clubs = [
    {
      'name': 'Real Madrid',
      'logo': 'assets/logos/rma.png'
    },
    {
      'name': 'Barcelona',
      'logo': 'assets/logos/fcb.png'
    },
    {
      'name': 'Atletico Madrid',
      'logo': 'assets/logos/atm.png'
    },
    {
      'name': 'Sevilla',
      'logo': 'assets/logos/svl.png'
    },
    {
      'name': 'Valencia',
      'logo': 'assets/logos/vlnc.png'
    },
    {
      'name': 'Villareal',
      'logo': 'assets/logos/villa.png'
    },
    {
      'name': 'Real Sociedad',
      'logo': 'assets/logos/socie.png'
    },
    {
      'name': 'Athletic Bilbao',
      'logo': 'assets/logos/bilb.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Liga'),
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