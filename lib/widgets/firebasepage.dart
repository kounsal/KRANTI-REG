import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FirebasePage extends StatefulWidget {
  @override
  _FirebasePageState createState() => _FirebasePageState();
}

class _FirebasePageState extends State<FirebasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Data'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('teams').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['teamname'] ?? ''),
                subtitle: Text(data['college'] ?? ''),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamDetailsPage(data: data),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class TeamDetailsPage extends StatelessWidget {
  final Map<String, dynamic> data;

  TeamDetailsPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['teamname'] ?? ''),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('College: ${data['college'] ?? ''}',
                style: const TextStyle(fontSize: 20)),
            Text('Team: ${data['teamname'] ?? ''}',
                style: const TextStyle(fontSize: 20)),
            Text('Play Name: ${data['playname'] ?? ''}',
                style: const TextStyle(fontSize: 20)),

            _buildClickableText('Poster', data['poster'] ?? ''),
            _buildClickableText('Logo', data['logo'] ?? ''),
            _buildClickableText('Play Video', data['playvideo'] ?? ''),
            _buildClickableText('Synopsis', data['synopsis'] ?? ''),
            _buildClickableText("Team Pic", data['teampic'] ?? ''),
            Text('Random Number: ${data['randomnumber'] ?? ''}',
                style: const TextStyle(fontSize: 20)),
            // Add more details here as needed
            const Text(
              "Poc Details:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "${data['poc'][0]['name']} -  ${data['poc'][0]['number']}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "${data['poc'][1]['name']} -  ${data['poc'][1]['number']}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableText(String label, String value) {
    return GestureDetector(
      onTap: () {
        if (value.contains('drive.google.com')) {
          _launchUrlInBrowser(value);
        } else {
          // Handle other types of URLs or actions here
        }
      },
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 16,
        ),
      ),
    );
  }

  void _launchUrlInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
