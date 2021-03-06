import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_admin/providers/dataUniversityProvider.dart';
import 'package:university_admin/routes/app_pages.dart';
import 'package:university_admin/screens/add_university/add_university.dart';

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
          create: (context) => DataUniversityProvider(),
        ),
      ],
      child: GetMaterialApp(
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
        home: AddUniversity(), //AppPages.INITIAL,
        routes: {
          AddUniversity.routeName: (context) => AddUniversity(),
        },
        getPages: AppPages.routes,
      ),
    );
  }
}
