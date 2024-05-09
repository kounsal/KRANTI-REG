import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:register/Homepage.dart';
//S`import 'package:register/LoginPage.dart';
import 'package:register/global/color_schemes.g.dart';
import 'package:register/global/firebase_options.dart';
// import 'package:register/studenregister.dart';
import 'package:register/widgets/firebasepage.dart';
// import 'package:register/studenregister.dart';
// import 'package:register/teamregister.dart';
// import 'package:register/widgets/createpdf.dart';
// import 'package:register/widgets/studentinfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: FirebasePage(),
    );
  }
}
