import 'package:flutter/material.dart';
import 'club_detail_page.dart';

class GermanLeaguePage extends StatelessWidget {
  // Daftar klub Liga Jerman dengan nama dan nama file logo di assets/logos
  final List<Map<String, String>> clubs = [
    {
      'name': 'Bayern Munich',
      'logo': 'assets/logos/fcbm.png'
    },
    {
      'name': 'Borussia Dortmund',
      'logo': 'assets/logos/bvb.png'
    },
    {
      'name': 'RB Leipzig',
      'logo': 'assets/logos/leipzig.png'
    },
    {
      'name': 'Bayer Leverkusen',
      'logo': 'assets/logos/lvk.png'
    },
    {
      'name': 'Borussia Mönchengladbach',
      'logo': 'assets/logos/gb.png'
    },
    {
      'name': 'Eintracht Frankfurt',
      'logo': 'assets/logos/frank.png'
    },
    {
      'name': 'VfL Wolfsburg',
      'logo': 'assets/logos/wolfs.png'
    },
    {
      'name': 'TSG Hoffenheim',
      'logo': 'assets/logos/hoffen.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bundesliga',
          style: TextStyle(color: Colors.black), // Teks putih
        ),
        backgroundColor: Colors.indigo.shade600, // Latar belakang hitam
        iconTheme: IconThemeData(
          color: Colors.white, // Warna ikon (termasuk tombol back) putih
        ),
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