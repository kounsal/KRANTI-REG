import 'package:flutter/material.dart';
import 'package:register/studenregister.dart';
import 'package:register/teamregister.dart';
import 'package:register/widgets/studentdetails.dart';
// import 'package:register/widgets/studentinfo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: const Text(
              'Kranti Registration Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                child: const Text('TEAM REGISTRATION'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StuRegistrationScreen()));
                  },
                  child: const Text('CANDIDATE REGISTRATION')),
            ],
          ),
        ],
      ),
    ));
  }
}
