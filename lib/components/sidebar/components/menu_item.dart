import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../constants.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Callback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size.height / 19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: kMenuItemColor,
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(icon),
              SizedBox(width: 20),
              Center(
                child: Text(
                  title,
                  style: kTextStyleMenuItem,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
