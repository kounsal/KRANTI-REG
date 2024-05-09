// registration_screen.dart
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:register/model/student.dart';
import 'package:register/utils/firebase_helper.dart';
import 'package:register/widgets/custom.dart';
// import 'package:register/widgets/custom.dart';
import 'package:register/widgets/studentdetails.dart';
// import 'package:register/widgets/teamDetails.dart';
// import 'package:register/widgets/textfield.dart';

class StuRegistrationScreen extends StatefulWidget {
  @override
  _StuRegistrationScreenState createState() => _StuRegistrationScreenState();
}

class _StuRegistrationScreenState extends State<StuRegistrationScreen> {
  String? code;
  Student student = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/img/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.1),
                        // borderRadius: BorderRadius.circular,
                        border: Border.all(
                          color: Colors.grey.shade200.withOpacity(0.5),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.shortestSide > 600
                          ? MediaQuery.of(context).size.width * 0.65
                          : MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomInput(
                            onChanged: (texty) {
                              code = texty;
                            },
                            hint: "Enter Team Code",
                            inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade200.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                QuerySnapshot snap = await FirebaseHelper()
                                    .gettingTeamData(code!);
                                student.college = snap.docs.first["college"];
                                student.teamname = snap.docs.first["teamname"];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StudentDetails(
                                        teamname: snap.docs.first["college"],
                                        college: snap.docs.first["teamname"],
                                      ),
                                    ));
                                // print(snap.docs.first["teamname"]);
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text("Check"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
