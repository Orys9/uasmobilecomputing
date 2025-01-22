import 'package:flutter/material.dart';
import 'club_detail_page.dart';

class ItalianLeaguePage extends StatelessWidget {
  // Daftar klub Liga Italia dengan nama dan nama file logo di assets/logos
  final List<Map<String, String>> clubs = [
    {
      'name': 'Juventus',
      'logo': 'assets/logos/jvt.png'
    },
    {
      'name': 'AC Milan',
      'logo': 'assets/logos/acm.png'
    },
    {
      'name': 'Inter Milan',
      'logo': 'assets/logos/interm.png'
    },
    {
      'name': 'AS Roma',
      'logo': 'assets/logos/asr.png'
    },
    {
      'name': 'Napoli',
      'logo': 'assets/logos/napoli.png'
    },
    {
      'name': 'Lazio',
      'logo': 'assets/logos/laz.png'
    },
    {
      'name': 'Atalanta',
      'logo': 'assets/logos/atl.png'
    },
    {
      'name': 'Fiorentina',
      'logo': 'assets/logos/fio.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serie A'),
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