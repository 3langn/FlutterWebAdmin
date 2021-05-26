import 'package:flutter/material.dart';
import 'package:university_admin/bloc.navigation_bloc/navigation_bloc.dart';

class Home extends StatelessWidget with NavigationStates {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ADMIN',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Xin chào'),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/my.jpg'),
              radius: 150,
            ),
          ],
        ),
      ),
    );
  }
}

// drawer: Drawer(
// child: ListView(
// padding: EdgeInsets.symmetric(horizontal: 20),
// children: <Widget>[
// DrawerHeader(
// child: Text('Admin'),
// ),
// CustomListTile(
// content: 'Thêm ngành học',
// routeName: AddMajors.routeName,
// ),
// CustomListTile(
// content: 'Thêm đại học',
// routeName: AddUniversity.routeName,
// ),
// ],
// ),
// ),
