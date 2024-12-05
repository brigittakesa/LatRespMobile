import 'package:flutter/material.dart';
import 'package:latian3/list/news.dart';
import 'package:latian3/list/blogs.dart';
import 'package:latian3/list/reports.dart';
import 'package:latian3/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({Key? key}) : super(key: key);

  @override
  State<MenuUtama> createState() => _MenuUtama();
}

class _MenuUtama extends State<MenuUtama> {
  late String username;
  late SharedPreferences loginData;

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username') ?? 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 50, 31, 98),
          title: Center(
            child: Text(
              "Hai, $username!",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildMenuItem(
              title: 'News',
              description:
                  'Get an overview of the latest SpaceFlight news, from various sources! Easily link your users to the right websites.',
              image: 'assets/news.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsList()),
                );
              },
            ),
            _buildMenuItem(
              title: 'Blog',
              description:
                  'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast.',
              image: 'assets/blog.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogList()),
                );
              },
            ),
            _buildMenuItem(
              title: 'Report',
              description:
                  'Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!',
              image: 'assets/report.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportsList()),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            loginData.setBool("login", true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          backgroundColor: const Color.fromARGB(255, 50, 31, 98),
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String description,
    required String image,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color.fromARGB(255, 235, 221, 255),
      shadowColor: Colors.deepPurple,
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
