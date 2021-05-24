import 'package:flutter/material.dart';
import 'package:university_admin/screens/add_majors.dart';
import 'package:university_admin/screens/add_university.dart';

const _kThemeDrawerColor = Colors.white;

class Home extends StatelessWidget {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            DrawerHeader(
              child: Text('Admin'),
            ),
            CustomListTile(
              content: 'Thêm ngành học',
              routeName: AddMajors.routeName,
            ),
            CustomListTile(
              content: 'Thêm đại học',
              routeName: AddUniversity.routeName,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.content,
    required this.routeName,
  }) : super(key: key);
  final String content;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurpleAccent.shade100,
              Colors.deepPurple.shade300,
            ],
          )),
      child: ListTile(
        leading: Icon(
          Icons.apartment_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(
          content,
          style: TextStyle(color: _kThemeDrawerColor),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
      ),
    );
  }
}
