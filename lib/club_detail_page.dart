import 'package:flutter/material.dart';

class ClubDetailPage extends StatelessWidget {
  final String clubName;
  final String logoUrl;

  // Dummy data pemain berdasarkan klub dengan posisi dalam tanda kurung
  final Map<String, List<String>> players = {
    'Manchester United': [
      'Andre Onana (Kiper)', 'Bruno Fernandes (Gelandang)', 'Marcus Rashford (Penyerang)',
      'Casemiro (Gelandang)', 'Raphaël Varane (Bek Tengah)', 'Jadon Sancho (Penyerang)',
      'Antony (Penyerang)', 'Christian Eriksen (Gelandang)', 'Alejandro Garnacho (Penyerang)',
      'Luke Shaw (Bek Kiri)'
    ],
    'Liverpool': [
      'Alisson Becker (Kiper)', 'Trent Alexander-Arnold (Bek Kanan)', 'Virgil van Dijk (Bek Tengah)',
      'Mohamed Salah (Penyerang)', 'Jordan Henderson (Gelandang)', 'Luis Díaz (Penyerang)',
      'Cody Gakpo (Penyerang)', 'James Milner (Gelandang)', 'Darwin Núñez (Penyerang)',
      'Roberto Firmino (Penyerang)'
    ],
    'Chelsea': [
      'Kepa Arrizabalaga (Kiper)', 'Thiago Silva (Bek Tengah)', 'Reece James (Bek Kanan)',
      'Mason Mount (Gelandang)', 'Kai Havertz (Penyerang)', 'Raheem Sterling (Penyerang)',
      'Enzo Fernández (Gelandang)', 'Ben Chilwell (Bek Kiri)', 'Christopher Nkunku (Penyerang)',
      'Mykhailo Mudryk (Penyerang)'
    ],
    'Arsenal': [
      'Aaron Ramsdale (Kiper)', 'Bukayo Saka (Penyerang)', 'Gabriel Magalhães (Bek Tengah)',
      'Martin Ødegaard (Gelandang)', 'William Saliba (Bek Tengah)', 'Thomas Partey (Gelandang)',
      'Gabriel Martinelli (Penyerang)', 'Ben White (Bek Kanan)', 'Eddie Nketiah (Penyerang)',
      'Granit Xhaka (Gelandang)'
    ],
    'Manchester City': [
      'Ederson (Kiper)', 'Kevin De Bruyne (Gelandang)', 'Erling Haaland (Penyerang)',
      'Phil Foden (Penyerang)', 'Rodri (Gelandang)', 'Bernardo Silva (Gelandang)',
      'John Stones (Bek Tengah)', 'Ruben Dias (Bek Tengah)', 'Jack Grealish (Penyerang)',
      'Ilkay Gündogan (Gelandang)'
    ],
    'Tottenham Hotspur': [
      'Hugo Lloris (Kiper)', 'Harry Kane (Penyerang)', 'Son Heung-min (Penyerang)',
      'Dejan Kulusevski (Penyerang)', 'Pierre-Emile Højbjerg (Gelandang)', 'Cristian Romero (Bek Tengah)',
      'Eric Dier (Bek Tengah)', 'Ivan Perišić (Penyerang)', 'Rodrigo Bentancur (Gelandang)',
      'Ben Davies (Bek Kiri)'
    ],
    'Leicester City': [
      'Kasper Schmeichel (Kiper)', 'Jamie Vardy (Penyerang)', 'James Maddison (Gelandang)',
      'Wilfred Ndidi (Gelandang)', 'Çağlar Söyüncü (Bek Tengah)', 'Ricardo Pereira (Bek Kanan)',
      'Harvey Barnes (Penyerang)', 'Youri Tielemans (Gelandang)', 'Jonny Evans (Bek Tengah)',
      'Kelechi Iheanacho (Penyerang)'
    ],
    'Everton': [
      'Jordan Pickford (Kiper)', 'Dominic Calvert-Lewin (Penyerang)', 'Richarlison (Penyerang)',
      'Abdoulaye Doucouré (Gelandang)', 'Allan (Gelandang)', 'Michael Keane (Bek Tengah)',
      'Yerry Mina (Bek Tengah)', 'Lucas Digne (Bek Kiri)', 'Andros Townsend (Penyerang)',
      'Demarai Gray (Penyerang)'
    ],
    'Juventus': [
      'Wojciech Szczęsny (Kiper)', 'Leonardo Bonucci (Bek Tengah)', 'Giorgio Chiellini (Bek Tengah)',
      'Paulo Dybala (Penyerang)', 'Federico Chiesa (Penyerang)', 'Weston McKennie (Gelandang)',
      'Dejan Kulusevski (Penyerang)', 'Arthur Melo (Gelandang)', 'Alvaro Morata (Penyerang)',
      'Matthijs de Ligt (Bek Tengah)'
    ],
    'AC Milan': [
      'Mike Maignan (Kiper)', 'Theo Hernández (Bek Kiri)', 'Fikayo Tomori (Bek Tengah)',
      'Franck Kessié (Gelandang)', 'Zlatan Ibrahimović (Penyerang)', 'Rafael Leão (Penyerang)',
      'Sandro Tonali (Gelandang)', 'Olivier Giroud (Penyerang)', 'Ismaël Bennacer (Gelandang)',
      'Alessio Romagnoli (Bek Tengah)'
    ],
    'Inter Milan': [
      'Samir Handanović (Kiper)', 'Milan Škriniar (Bek Tengah)', 'Alessandro Bastoni (Bek Tengah)',
      'Nicolò Barella (Gelandang)', 'Lautaro Martínez (Penyerang)', 'Ivan Perišić (Penyerang)',
      'Marcelo Brozović (Gelandang)', 'Edin Džeko (Penyerang)', 'Joaquín Correa (Penyerang)',
      'Stefan de Vrij (Bek Tengah)'
    ],
    'AS Roma': [
      'Rui Patrício (Kiper)', 'Chris Smalling (Bek Tengah)', 'Gianluca Mancini (Bek Tengah)',
      'Lorenzo Pellegrini (Gelandang)', 'Tammy Abraham (Penyerang)', 'Nicolò Zaniolo (Penyerang)',
      'Jordan Veretout (Gelandang)', 'Henrikh Mkhitaryan (Gelandang)', 'Eldor Shomurodov (Penyerang)',
      'Roger Ibañez (Bek Tengah)'
    ],
    'Napoli': [
      'Alex Meret (Kiper)', 'Kalidou Koulibaly (Bek Tengah)', 'Giovanni Di Lorenzo (Bek Kanan)',
      'Fabian Ruiz (Gelandang)', 'Lorenzo Insigne (Penyerang)', 'Victor Osimhen (Penyerang)',
      'Piotr Zieliński (Gelandang)', 'Dries Mertens (Penyerang)', 'Hirving Lozano (Penyerang)',
      'Kostas Manolas (Bek Tengah)'
    ],
    'Lazio': [
      'Thomas Strakosha (Kiper)', 'Ciro Immobile (Penyerang)', 'Sergej Milinković-Savić (Gelandang)',
      'Luis Alberto (Gelandang)', 'Francesco Acerbi (Bek Tengah)', 'Manuel Lazzari (Bek Kanan)',
      'Patric (Bek Kanan)', 'Lucas Leiva (Gelandang)', 'Felipe Anderson (Penyerang)',
      'Elseid Hysaj (Bek Kanan)'
    ],
    'Atalanta': [
      'Juan Musso (Kiper)', 'Duván Zapata (Penyerang)', 'Josip Iličić (Penyerang)',
      'Ruslan Malinovskyi (Gelandang)', 'Rafael Tolói (Bek Tengah)', 'Berat Djimsiti (Bek Tengah)',
      'Robin Gosens (Bek Kiri)', 'Marten de Roon (Gelandang)', 'Remo Freuler (Gelandang)',
      'Mario Pašalić (Gelandang)'
    ],
    'Fiorentina': [
      'Pietro Terracciano (Kiper)', 'Dusan Vlahovic (Penyerang)', 'Gaetano Castrovilli (Gelandang)',
      'Nicolás González (Penyerang)', 'Lucas Martínez Quarta (Bek Tengah)', 'Cristiano Biraghi (Bek Kiri)',
      'Erick Pulgar (Gelandang)', 'Alfred Duncan (Gelandang)', 'José Callejón (Penyerang)',
      'Nikola Milenković (Bek Tengah)'
    ],
    'Real Madrid': [
      'Thibaut Courtois (Kiper)', 'Dani Carvajal (Bek Kanan)', 'Éder Militão (Bek Tengah)',
      'David Alaba (Bek Tengah)', 'Luka Modrić (Gelandang)', 'Toni Kroos (Gelandang)',
      'Federico Valverde (Gelandang)', 'Vinícius Júnior (Penyerang)', 'Karim Benzema (Penyerang)',
      'Rodrygo (Penyerang)'
    ],
    'Barcelona': [
      'Marc-André ter Stegen (Kiper)', 'Jordi Alba (Bek Kiri)', 'Ronald Araújo (Bek Tengah)',
      'Gerard Piqué (Bek Tengah)', 'Sergio Busquets (Gelandang)', 'Pedri (Gelandang)',
      'Frenkie de Jong (Gelandang)', 'Ansu Fati (Penyerang)', 'Robert Lewandowski (Penyerang)',
      'Ousmane Dembélé (Penyerang)'
    ],
    'Atletico Madrid': [
      'Jan Oblak (Kiper)', 'Kieran Trippier (Bek Kanan)', 'José Giménez (Bek Tengah)',
      'Stefan Savić (Bek Tengah)', 'Koke (Gelandang)', 'Saúl Ñíguez (Gelandang)',
      'Thomas Lemar (Gelandang)', 'Antoine Griezmann (Penyerang)', 'Álvaro Morata (Penyerang)',
      'João Félix (Penyerang)'
    ],
    'Sevilla': [
      'Yassine Bounou (Kiper)', 'Jesús Navas (Bek Kanan)', 'Jules Koundé (Bek Tengah)',
      'Diego Carlos (Bek Tengah)', 'Joan Jordán (Gelandang)', 'Ivan Rakitić (Gelandang)',
      'Lucas Ocampos (Penyerang)', 'Youssef En-Nesyri (Penyerang)', 'Munir El Haddadi (Penyerang)',
      'Papu Gómez (Penyerang)'
    ],
    'Valencia': [
      'Giorgi Mamardashvili (Kiper)', 'Thierry Correia (Bek Kanan)', 'Gabriel Paulista (Bek Tengah)',
      'Mouctar Diakhaby (Bek Tengah)', 'Carlos Soler (Gelandang)', 'Hugo Guillamón (Gelandang)',
      'Gonçalo Guedes (Penyerang)', 'Maxi Gómez (Penyerang)', 'Bryan Gil (Penyerang)',
      'Hélder Costa (Penyerang)'
    ],
    'Villareal': [
      'Gerónimo Rulli (Kiper)', 'Gerard Moreno (Penyerang)', 'Pau Torres (Bek Tengah)',
      'Raúl Albiol (Bek Tengah)', 'Dani Parejo (Gelandang)', 'Yeremi Pino (Penyerang)',
      'Alfonso Pedraza (Bek Kiri)', 'Étienne Capoue (Gelandang)', 'Arnaut Danjuma (Penyerang)',
      'Juan Foyth (Bek Kanan)'
    ],
    'Real Sociedad': [
      'Álex Remiro (Kiper)', 'Mikel Oyarzabal (Penyerang)', 'Alexander Isak (Penyerang)',
      'David Silva (Gelandang)', 'Robin Le Normand (Bek Tengah)', 'Aritz Elustondo (Bek Tengah)',
      'Ander Guevara (Gelandang)', 'Portu (Penyerang)', 'Adnan Januzaj (Penyerang)',
      'Nacho Monreal (Bek Kiri)'
    ],
    'Athletic Bilbao': [
      'Unai Simón (Kiper)', 'Iñaki Williams (Penyerang)', 'Raúl García (Penyerang)',
      'Iker Muniain (Gelandang)', 'Yeray Álvarez (Bek Tengah)', 'Dani Vivian (Bek Tengah)',
      'Mikel Vesga (Gelandang)', 'Óscar de Marcos (Bek Kanan)', 'Alex Berenguer (Penyerang)',
      'Iñigo Martínez (Bek Tengah)'
    ],
    'Bayern Munich': [
      'Manuel Neuer (Kiper)', 'Benjamin Pavard (Bek Kanan)', 'Dayot Upamecano (Bek Tengah)',
      'Lucas Hernández (Bek Tengah)', 'Joshua Kimmich (Gelandang)', 'Leon Goretzka (Gelandang)',
      'Leroy Sané (Penyerang)', 'Serge Gnabry (Penyerang)', 'Thomas Müller (Penyerang)',
      'Robert Lewandowski (Penyerang)'
    ],
    'Borussia Dortmund': [
      'Gregor Kobel (Kiper)', 'Thomas Meunier (Bek Kanan)', 'Mats Hummels (Bek Tengah)',
      'Manuel Akanji (Bek Tengah)', 'Jude Bellingham (Gelandang)', 'Mahmoud Dahoud (Gelandang)',
      'Marco Reus (Penyerang)', 'Erling Haaland (Penyerang)', 'Donyell Malen (Penyerang)',
      'Thorgan Hazard (Penyerang)'
    ],
    'RB Leipzig': [
      'Péter Gulácsi (Kiper)', 'Nordi Mukiele (Bek Kanan)', 'Willi Orban (Bek Tengah)',
      'Josko Gvardiol (Bek Tengah)', 'Konrad Laimer (Gelandang)', 'Dani Olmo (Gelandang)',
      'Christopher Nkunku (Penyerang)', 'André Silva (Penyerang)', 'Emil Forsberg (Penyerang)',
      'Dominik Szoboszlai (Penyerang)'
    ],
    'Bayer Leverkusen': [
      'Lukáš Hrádecký (Kiper)', 'Jeremie Frimpong (Bek Kanan)', 'Jonathan Tah (Bek Tengah)',
      'Edmond Tapsoba (Bek Tengah)', 'Florian Wirtz (Gelandang)', 'Kerem Demirbay (Gelandang)',
      'Moussa Diaby (Penyerang)', 'Patrik Schick (Penyerang)', 'Amine Adli (Penyerang)',
      'Karim Bellarabi (Penyerang)'
    ],
    'Borussia Mönchengladbach': [
      'Yann Sommer (Kiper)', 'Stefan Lainer (Bek Kanan)', 'Matthias Ginter (Bek Tengah)',
      'Nico Elvedi (Bek Tengah)', 'Florian Neuhaus (Gelandang)', 'Jonas Hofmann (Gelandang)',
      'Alassane Pléa (Penyerang)', 'Marcus Thuram (Penyerang)', 'Breel Embolo (Penyerang)',
      'Lars Stindl (Penyerang)'
    ],
    'Eintracht Frankfurt': [
      'Kevin Trapp (Kiper)', 'Filip Kostić (Bek Kiri)', 'Martin Hinteregger (Bek Tengah)',
      'Evan Ndicka (Bek Tengah)', 'Djibril Sow (Gelandang)', 'Daichi Kamada (Gelandang)',
      'Jesper Lindstrøm (Penyerang)', 'Rafael Santos Borré (Penyerang)', 'Ansgar Knauff (Penyerang)',
      'Almamy Touré (Bek Kanan)'
    ],
    'VfL Wolfsburg': [
      'Koen Casteels (Kiper)', 'Maxence Lacroix (Bek Tengah)', 'John Brooks (Bek Tengah)',
      'Ridle Baku (Bek Kanan)', 'Maximilian Arnold (Gelandang)', 'Xaver Schlager (Gelandang)',
      'Wout Weghorst (Penyerang)', 'Lukas Nmecha (Penyerang)', 'Dodi Lukebakio (Penyerang)',
      'Renato Steffen (Penyerang)'
    ],
    'TSG Hoffenheim': [
      'Oliver Baumann (Kiper)', 'Kevin Vogt (Bek Tengah)', 'Stefan Posch (Bek Tengah)',
      'David Raum (Bek Kiri)', 'Florian Grillitsch (Gelandang)', 'Dennis Geiger (Gelandang)',
      'Andrej Kramarić (Penyerang)', 'Ihlas Bebou (Penyerang)', 'Jacob Bruun Larsen (Penyerang)',
      'Christoph Baumgartner (Penyerang)'
    ],
  };

  // Dummy deskripsi berdasarkan klub
  final Map<String, String> descriptions = {
    'Manchester United': 'Manchester United adalah salah satu klub sepak bola terbesar dan paling terkenal di dunia, yang berbasis di Manchester, Inggris. Klub ini didirikan pada tahun 1878 dengan nama awal Newton Heath LYR Football Club, sebelum mengubah namanya menjadi Manchester United pada tahun 1902 setelah diselamatkan dari kebangkrutan oleh pengusaha John Henry Davies.',
    'Liverpool': 'Liverpool adalah klub sepak bola profesional yang berbasis di Liverpool, Inggris. Didirikan pada tahun 1892, klub ini dikenal dengan sejarah panjangnya dan basis penggemar yang setia di seluruh dunia.',
    'Chelsea': 'Chelsea Football Club, berbasis di London, Inggris, adalah salah satu klub sepak bola paling sukses di era modern, didirikan pada tahun 1905.',
    'Arsenal': 'Arsenal adalah klub sepak bola profesional yang berbasis di London, Inggris, didirikan pada tahun 1886. Klub ini dikenal dengan julukan "The Gunners".',
    'Manchester City': 'Manchester City adalah klub sepak bola profesional yang berbasis di Manchester, Inggris. Klub ini didirikan pada tahun 1880 dengan nama awal St. Mark`s (West Gorton).',
    'Tottenham Hotspur': 'Tottenham Hotspur adalah klub sepak bola profesional yang berbasis di London, Inggris. Didirikan pada tahun 1882, klub ini dikenal dengan julukan "Spurs". Klub ini memiliki basis penggemar yang besar dan bermarkas di Stadion Tottenham Hotspur.',
    'Leicester City': 'Leicester City adalah klub sepak bola profesional yang berbasis di Leicester, Inggris. Didirikan pada tahun 1884, klub ini dikenal dengan kejutan mereka memenangkan Premier League pada musim 2015-2016.',
    'Everton': 'Everton adalah klub sepak bola profesional yang berbasis di Liverpool, Inggris. Didirikan pada tahun 1878, klub ini adalah salah satu pendiri Football League.',
    'Juventus': 'Juventus adalah klub sepak bola profesional yang berbasis di Turin, Italia. Didirikan pada tahun 1897, Juventus adalah salah satu klub paling sukses di Italia dan Eropa.',
    'AC Milan': 'AC Milan adalah klub sepak bola profesional yang berbasis di Milan, Italia. Didirikan pada tahun 1899, klub ini dikenal dengan sejarah panjangnya dan prestasi di tingkat Eropa.',
    'Inter Milan': 'Inter Milan adalah klub sepak bola profesional yang berbasis di Milan, Italia. Didirikan pada tahun 1908, klub ini dikenal dengan julukan "Nerazzurri".',
    'AS Roma': 'AS Roma adalah klub sepak bola profesional yang berbasis di Roma, Italia. Didirikan pada tahun 1927, klub ini dikenal dengan basis penggemar yang setia dan prestasinya di Serie A serta kompetisi Eropa. Stadion kandang mereka adalah Stadio Olimpico, yang mereka bagi dengan rival sekota, Lazio.',
    'Napoli': 'Napoli adalah klub sepak bola profesional yang berbasis di Naples, Italia. Didirikan pada tahun 1926, klub ini dikenal dengan prestasinya di Serie A dan kompetisi Eropa. Napoli memiliki basis penggemar yang sangat fanatik dan bermarkas di Stadio Diego Armando Maradona, yang dinamai untuk menghormati legenda sepak bola Diego Maradona.',
    'Lazio': 'Lazio adalah klub sepak bola profesional yang berbasis di Roma, Italia. Didirikan pada tahun 1900, klub ini dikenal dengan basis penggemar yang setia.',
    'Atalanta': 'Atalanta adalah klub sepak bola profesional yang berbasis di Bergamo, Italia. Didirikan pada tahun 1907, klub ini dikenal dengan gaya bermain ofensif mereka.',
    'Fiorentina': 'Fiorentina adalah klub sepak bola profesional yang berbasis di Florence, Italia. Didirikan pada tahun 1926, klub ini dikenal dengan julukan "Viola".',
    'Real Madrid': 'Real Madrid adalah klub sepak bola profesional yang berbasis di Madrid, Spanyol. Didirikan pada tahun 1902, klub ini dikenal sebagai salah satu klub paling sukses di dunia.',
    'Barcelona': 'Barcelona adalah klub sepak bola profesional yang berbasis di Barcelona, Spanyol. Didirikan pada tahun 1899, klub ini dikenal dengan julukan "Blaugrana".',
    'Atletico Madrid': 'Atletico Madrid adalah klub sepak bola profesional yang berbasis di Madrid, Spanyol. Didirikan pada tahun 1903, klub ini dikenal dengan julukan "Los Colchoneros".',
    'Sevilla': 'Sevilla adalah klub sepak bola profesional yang berbasis di Sevilla, Spanyol. Didirikan pada tahun 1890, klub ini dikenal dengan prestasinya di Liga Eropa UEFA. Klub ini memiliki julukan "Los Nervionenses" dan bermarkas di Stadion Ramón Sánchez Pizjuán.',
    'Valencia': 'Valencia adalah klub sepak bola profesional yang berbasis di Valencia, Spanyol. Didirikan pada tahun 1919, klub ini dikenal dengan julukan "Los Che". Valencia memiliki sejarah panjang dan prestasi di La Liga serta kompetisi Eropa. Stadion kandang mereka adalah Mestalla.',
    'Villareal': 'Villarreal adalah klub sepak bola profesional yang berbasis di Villarreal, Spanyol. Didirikan pada tahun 1923, klub ini dikenal dengan prestasinya di Liga Eropa UEFA. Klub ini memiliki julukan "El Submarino Amarillo" (Kapal Selam Kuning).',
    'Real Sociedad': 'Real Sociedad adalah klub sepak bola profesional yang berbasis di San Sebastián, Spanyol. Didirikan pada tahun 1909, klub ini dikenal dengan julukan "La Real".',
    'Athletic Bilbao': 'Athletic Bilbao adalah klub sepak bola profesional yang berbasis di Bilbao, Spanyol. Didirikan pada tahun 1898, klub ini dikenal dengan kebijakan hanya merekrut pemain Basque.',
    'Bayern Munich': 'Bayern Munich adalah klub sepak bola profesional yang berbasis di Munich, Jerman. Didirikan pada tahun 1900, klub ini dikenal sebagai salah satu klub paling sukses di dunia.',
    'Borussia Dortmund': 'Borussia Dortmund adalah klub sepak bola profesional yang berbasis di Dortmund, Jerman. Didirikan pada tahun 1909, klub ini dikenal dengan basis penggemar yang setia.',
    'RB Leipzig': 'RB Leipzig adalah klub sepak bola profesional yang berbasis di Leipzig, Jerman. Didirikan pada tahun 2009, klub ini dikenal dengan pendekatan modern dalam sepak bola.',
    'Bayer Leverkusen': 'Bayer Leverkusen adalah klub sepak bola profesional yang berbasis di Leverkusen, Jerman. Didirikan pada tahun 1904, klub ini dikenal dengan julukan "Die Werkself" (Tim Pabrik) karena hubungannya dengan perusahaan Bayer AG. Leverkusen bermain di Bundesliga dan memiliki sejarah panjang di kompetisi domestik dan Eropa.',
    'Borussia Mönchengladbach': 'Borussia Mönchengladbach adalah klub sepak bola profesional yang berbasis di Mönchengladbach, Jerman. Didirikan pada tahun 1900, klub ini dikenal dengan julukan "Die Fohlen" (Anak Kuda). Mereka memiliki sejarah panjang di Bundesliga dan pernah mendominasi sepak bola Jerman pada era 1970-an. Stadion kandang mereka adalah Borussia-Park.',
    'Eintracht Frankfurt': 'Eintracht Frankfurt adalah klub sepak bola profesional yang berbasis di Frankfurt, Jerman. Didirikan pada tahun 1899, klub ini dikenal dengan prestasinya di Liga Eropa UEFA.',
    'VfL Wolfsburg': 'VfL Wolfsburg adalah klub sepak bola profesional yang berbasis di Wolfsburg, Jerman. Didirikan pada tahun 1945, klub ini dikenal dengan dukungan finansial dari Volkswagen.',
    'TSG Hoffenheim': 'TSG Hoffenheim adalah klub sepak bola profesional yang berbasis di Hoffenheim, Jerman. Didirikan pada tahun 1899, klub ini dikenal dengan pendekatan modern dalam sepak bola.',
  };

  ClubDetailPage({required this.clubName, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    final playerList = players[clubName] ?? [];
    final description = descriptions[clubName] ?? 'Deskripsi untuk klub ini belum tersedia.';

    return Scaffold(
      appBar: AppBar(
        title: Text(clubName),
        backgroundColor: Colors.indigo.shade600,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logoUrl,
                width: 120,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 120, color: Colors.red);
                },
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Pemain $clubName',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: playerList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(playerList[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}