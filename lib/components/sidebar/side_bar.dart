import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_admin/bloc.navigation_bloc/navigation_bloc.dart';

import 'components/custom_menu_clipper.dart';
import 'components/menu_item.dart';
import 'constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  final _animationDuration = const Duration(milliseconds: 300);

  bool isOpenedSideBar = false;

  late Stream<bool> isSideBarOpenedStream;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onIconSideBarPress() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      isOpenedSideBar = !isOpenedSideBar;
    });
  }

  onIconPress(int index) {
    onIconSideBarPress();
    switch (index) {
      case 1:
        BlocProvider.of<NavigationBloc>(context)
            .add(NavigationEvents.HomePageClickedEvent);
        break;
      case 2:
        BlocProvider.of<NavigationBloc>(context)
            .add(NavigationEvents.AddMajorsClickedEvent);
        break;
      case 3:
        BlocProvider.of<NavigationBloc>(context)
            .add(NavigationEvents.AddUniversityClickedEvent);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: isOpenedSideBar ? -size.width / 6 : 0,
      right: isOpenedSideBar ? 0 : 0,
      duration: _animationDuration,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_sidebar4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: size.width / 6,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.black12,
                ),
                width: size.width / 6,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    ListTile(
                      title: Text(
                        "  University",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.8),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.home_filled,
                      onTap: () => onIconPress(1),
                      title: 'DashBoard',
                    ),
                    MenuItem(
                      icon: Icons.school,
                      onTap: () => onIconPress(2),
                      title: 'Thêm Ngành',
                    ),
                    MenuItem(
                      icon: Icons.apartment_outlined,
                      onTap: () => onIconPress(3),
                      title: 'Thêm trường',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment(0, -0.9),
            child: InkWell(
              onTap: () => onIconSideBarPress(),
              child: ClipPath(
                clipper: CustomMenuClipper(),
                child: Container(
                  width: 35,
                  height: 110,
                  color: Color.fromRGBO(156, 177, 189, 0.9),
                  alignment: Alignment.centerLeft,
                  child: AnimatedIcon(
                    color: kMenuItemColor,
                    progress: _animationController.view,
                    icon: AnimatedIcons.close_menu,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
