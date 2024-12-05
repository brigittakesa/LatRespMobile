import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latian3/models/news_model.dart';

class NewsDetail extends StatelessWidget {
  final Results news;
  const NewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.grey),
        title: Text(
          "NEWS DETAIL",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 50, 31, 98),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              news.imageUrl ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              news.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              news.newsSite ?? '',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 12),
            Text(
              news.publishedAt ?? '',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              news.summary ?? '',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _launchURL(news.url ?? '');
        },
        icon: Icon(
          Icons.open_in_browser,
          color: Colors.white,
        ),
        label: Text("See More", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 50, 31, 98),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
