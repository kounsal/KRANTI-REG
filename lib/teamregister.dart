// registration_screen.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:register/widgets/teamDetails.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                MediaQuery.of(context).size.shortestSide > 600
                    ? Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/img/kranti.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.6,
                      )
                    : Container(),
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
                          ? MediaQuery.of(context).size.width * 0.35
                          : MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: TeamDetails(),
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
