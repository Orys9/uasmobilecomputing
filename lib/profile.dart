import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = '';
  String phone = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  Future<void> _getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username') ?? widget.username;

    if (username == null || username.isEmpty) {
      _showSnackBar('Username is missing');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(
            'https://teknologi22.xyz/project_api/api_ryski/football/get_profile.php'),
        body: {'username': username},
      );

      if (response.statusCode == 200) {
        try {
          final data = jsonDecode(response.body);

          if (data['status'] == 'success') {
            setState(() {
              email = data['email'] ?? 'Email tidak tersedia';
              phone = data['phone'] ?? 'Nomor telepon tidak tersedia';
            });
          } else {
            _showSnackBar(
                data['message'] ?? 'Gagal mendapatkan profil pengguna');
          }
        } catch (e) {
          _showSnackBar('Error parsing JSON: $e');
        }
      } else {
        _showSnackBar('Server Error (${response.statusCode})');
      }
    } catch (e) {
      _showSnackBar('Gagal terhubung ke server: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.indigo.shade600,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade200, Colors.indigo.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.white))
            : Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar dengan animasi
                    Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.indigo.shade400,
                              Colors.indigo.shade800
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo.shade900.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Username dengan animasi
                    Center(
                      child: AnimatedOpacity(
                        opacity: 1,
                        duration: Duration(seconds: 1),
                        child: Text(
                          'Username: ${widget.username}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 5,
                                color: Colors.indigo.shade900,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Card untuk informasi profil
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.white, // Latar belakang Card putih solid
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile Information',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade800, // Warna teks yang kontras dengan latar belakang putih
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildProfileItem(Icons.email, 'Email', email),
                            _buildProfileItem(Icons.phone, 'Phone', phone),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade800, size: 24), // Warna ikon yang kontras dengan latar belakang putih
          SizedBox(width: 10),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade800, // Warna teks yang kontras dengan latar belakang putih
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.indigo.shade800, // Warna teks yang kontras dengan latar belakang putih
              ),
            ),
          ),
        ],
      ),
    );
  }
}