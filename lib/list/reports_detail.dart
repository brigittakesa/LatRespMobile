import 'package:flutter/material.dart';
import 'package:latian3/models/report_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportsDetail extends StatelessWidget {
  final Results report;
  const ReportsDetail({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.grey),
        title: Text(
          "REPORTS DETAIL",
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
              report.imageUrl ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              report.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 14),
            Text(
              report.newsSite ?? '',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 14),
            Text(
              report.publishedAt ?? '',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              report.summary ?? '',
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
          _launchURL(report.url ?? '');
        },
        icon: Icon(
          Icons.image_search_outlined,
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
