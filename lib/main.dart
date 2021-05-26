import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_admin/providers/dataMajorsProvider.dart';
import 'package:university_admin/providers/dataUniversityProvider.dart';
import 'package:university_admin/screens/add_majors.dart';
import 'package:university_admin/screens/add_university.dart';
import 'package:university_admin/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataMajorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataUniversityProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // accentColor: Colors.black54,
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          canvasColor: Colors.white,
        ),
        home: MainScreen(),
        routes: {
          AddUniversity.routeName: (context) => AddUniversity(),
          AddMajors.routeName: (context) => AddMajors(),
        },
      ),
    );
  }
}
