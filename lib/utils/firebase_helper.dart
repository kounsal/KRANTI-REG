// firebase_helper.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:register/model/student.dart';
import 'package:register/model/team.dart';

class FirebaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTeamRegistration(Team team) async {
    try {
      await _firestore.collection('teams').add({
        'teamname': team.teamname,
        'college': team.college,
        'logo': team.logo,
        'poster': team.poster,
        'playname': team.playname,
        'synopsis': team.synopsis,
        'playvideo': team.playvideo,
        'poc': team.poc,
        'teampic': team.teampic,
        'randomnumber': team.randomnumber,
        'code': team.code,
      });
    } catch (e) {
      print('Error adding team registration: $e');
    }
  }

  Future<void> addStudentRegistration(Student stu) async {
    try {
      await _firestore.collection('Student').add({
        'Teamname': stu.teamname,
        'College': stu.college,
        'Name': stu.name,
        'Phone Number': stu.phone,
        'Email': stu.email,
      });
    } catch (e) {
      print('Error adding Candidate registration: $e');
    }
  }

  Future gettingTeamData(String code) async {
    QuerySnapshot snapshot = await _firestore
        .collection('teams')
        .where("code", isEqualTo: code)
        .get();
    // if (snapshot.docs.isNotEmpty) {
    //   return snapshot.docs.first;
    // }

    return snapshot;
  }
}
