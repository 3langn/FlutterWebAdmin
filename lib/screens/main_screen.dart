import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_admin/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:university_admin/components/sidebar/side_bar.dart';

import 'home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(Home()),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationStates) {
              return navigationStates as Widget;
            }),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
