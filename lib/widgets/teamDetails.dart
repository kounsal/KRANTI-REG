import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:register/utils/firebase_helper.dart';
import 'package:register/model/team.dart';
import 'package:register/utils/validator.dart';
import 'package:register/widgets/custom.dart';
import 'package:register/widgets/textfield.dart';
import 'dart:math';
// import 'package:custom_text_form_field_plus/custom_text_form_field_plus.dart';

class TeamDetails extends StatefulWidget {
  const TeamDetails({super.key});

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  Team team = Team();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Basicdetails(
        teamd: team,
      ),
    );
  }
}

class Basicdetails extends StatelessWidget {
  const Basicdetails({
    super.key,
    required this.teamd,
  });
  final Team teamd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('पार्टी पंजीकरण प्रपत्र'),
      ),
      body: Form(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomInput(
            onChanged: (texty) {
              teamd.teamname = texty;
            },
            hint: "राजनीतिक दल का नाम",
            inputBorder: OutlineInputBorder(),
          ),
          CustomInput(
            onChanged: (texty) {
              teamd.college = texty;
            },
            hint: "राजनीतिक दल कार्यालय का नाम",
            inputBorder: OutlineInputBorder(),
          ),
          CustomInput(
            onChanged: (texty) {
              teamd.logo = texty;
            },
            hint: "चुनव चिन (ड्राइव लिंक)",
            inputBorder: OutlineInputBorder(),
          ),
          CustomInput(
            onChanged: (texty) {
              teamd.poster = texty;
            },
            hint: "राजनीतिक दल का प्रचार पोस्टर (ड्राइव लिंक)",
            inputBorder: OutlineInputBorder(),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                if (teamd.teamname == null &&
                    teamd.college == null &&
                    teamd.logo == null &&
                    teamd.poster == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      showCloseIcon: true,
                      backgroundColor: Colors.red,
                      content: Text('सभी फ़ील्ड आवश्यक हैं.'),
                    ),
                  );
                  // Navigate only if all fields are not empty
                } else {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Playdetails(
                        teamd: teamd,
                      ),
                    ),
                  );
                  // Show a message to the user indicating that all fields are required
                }
              },
              child: const Text('Next'),
            ),
          ),
        ]),
      ),
    );
  }
}

class Playdetails extends StatelessWidget {
  Playdetails({
    super.key,
    required this.teamd,
  });
  final Team teamd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       PageTransition(
        //         type: PageTransitionType.rightToLeft,
        //         child: Basicdetails(
        //           teamd: teamd,
        //         ),
        //       ),
        //     );
        //   },
        // ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('स्ट्रीटप्ले की जानकारी'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CustomInput(
          onChanged: (texty) {
            teamd.playname = texty;
          },
          hint: "उम्मीदवार का नाम",
          inputBorder: OutlineInputBorder(),
        ),
        CustomInput(
          onChanged: (texty) {
            teamd.synopsis = texty;
          },
          hint: "उम्मीदवार के बारे में सारांश (ड्राइव लिंक)",
          inputBorder: OutlineInputBorder(),
        ),
        CustomInput(
          onChanged: (texty) {
            teamd.playvideo = texty;
          },
          hint: "उम्मीदवार प्रचार वीडियो (ड्राइव लिंक)",
          inputBorder: OutlineInputBorder(),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () {
              if (teamd.playname != null &&
                  teamd.synopsis != null &&
                  teamd.playvideo != null) {
                // Navigate only if all fields are not empty

                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Pocdetails(
                      teamd: teamd,
                    ),
                  ),
                );
              } else {
                // Show a message to the user indicating that all fields are required
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    showCloseIcon: true,
                    backgroundColor: Colors.red,
                    content: Text('सभी फ़ील्ड आवश्यक हैं.'),
                  ),
                );
              }
            },
            child: const Text('Next'),
          ),
        ),
      ]),
    );
  }
}

class Pocdetails extends StatelessWidget {
  Pocdetails({
    super.key,
    required this.teamd,
  });
  final Team teamd;
  String? poc1name;
  String? poc1number;
  String? poc2name;
  String? poc2number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       PageTransition(
        //           type: PageTransitionType.rightToLeft,
        //           child: Playdetails(teamd: teamd)),
        //     );
        //   },
        // ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('घाट घाट का पानी पीने वाले'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CustomInput(
          onChanged: (texty) {
            poc1name = texty;
          },
          hint: "सदस्य 1 का नाम",
          inputBorder: OutlineInputBorder(),
        ),
        CustomInput(
          onChanged: (texty) {
            poc1number = texty;
            //  teamd.poc = texty;
          },
          hint: "सदस्य 1 का फोन नंबर",
          inputBorder: OutlineInputBorder(),
        ),
        CustomInput(
          onChanged: (texty) {
            poc2name = texty;
            //  teamd.poc = texty;
          },
          hint: "सदस्य 2 का नाम",
          inputBorder: OutlineInputBorder(),
        ),
        CustomInput(
          onChanged: (texty) {
            poc2number = texty;
          },
          hint: "सदस्य 2 का फोन नंबर",
          inputBorder: OutlineInputBorder(),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () {
              if (poc1name != null &&
                  poc1number != null &&
                  poc2name != null &&
                  poc2number != null) {
                teamd.poc = [
                  {
                    'name': poc1name,
                    'number': poc1number,
                  },
                  {
                    'name': poc2name,
                    'number': poc2number,
                  }
                ];
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Otherdetails(
                      teamd: teamd,
                    ),
                  ),
                );
              } else {
                // Show a message to the user indicating that all fields are required
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    showCloseIcon: true,
                    backgroundColor: Colors.red,
                    content: Text('सभी फ़ील्ड आवश्यक हैं.'),
                  ),
                );
              }
            },
            child: const Text('Next'),
          ),
        ),
      ]),
    );
  }
}

class Otherdetails extends StatelessWidget {
  String generateRandomCode(String? teamName, String? college) {
    if (teamName == null || college == null) {
      return ''; // Return an empty string if either teamName or college is null
    }

    String teamAbbreviation =
        teamName.substring(0, min(3, teamName.length)).toUpperCase();
    String collegeAbbreviation =
        college.substring(0, min(3, college.length)).toUpperCase();

    return '$teamAbbreviation$collegeAbbreviation';
  }

  Otherdetails({
    super.key,
    required this.teamd,
  });
  final Team teamd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('अन्य विवरण'),
      ),
      body: Form(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomInput(
            onChanged: (texty) {
              teamd.teampic = texty;
            },
            hint: "कैबिनेट के सदस्यों की तस्वीर (ड्राइव लिंक)",
            inputBorder: OutlineInputBorder(),
          ),
          CustomInput(
            onChanged: (texty) {
              teamd.randomnumber = int.parse(texty);
            },
            hint: "रैंडम संख्या चुने ",
            inputBorder: OutlineInputBorder(),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () async {
                teamd.code = generateRandomCode(teamd.teamname, teamd.college);
                if (teamd.randomnumber != null && teamd.teampic != null) {
                  try {
                    await FirebaseHelper().addTeamRegistration(teamd);
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 100,
                                  ),
                                  Text(
                                    'Registration Successful , TEAM CODE: ${teamd.code}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  } catch (e) {
                    SnackBar(
                      showCloseIcon: true,
                      backgroundColor: Colors.red,
                      content: Text('टीम पंजीकरण जोड़ने में त्रुटि: $e'),
                    );
                  }
                } else {
                  // Show a message to the user indicating that all fields are required
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      showCloseIcon: true,
                      backgroundColor: Colors.red,
                      content: Text('सभी फ़ील्ड आवश्यक हैं.'),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ]),
      ),
    );
  }
}




// घाट घाट का पानी पीने वाला 