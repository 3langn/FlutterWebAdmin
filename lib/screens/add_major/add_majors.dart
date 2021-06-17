import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_admin/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:university_admin/screens/add_major/controllers/add_major_controller.dart';

import 'components/emulation.dart';
import 'components/input_field.dart';
import 'components/nganh_da_co.dart';

class AddMajorsScreen extends GetView<AddMajorController>
    with NavigationStates {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AddMajorController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Thêm ngành'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(),
              Emulation(),
              NganhDaCo(size: size),
            ],
          ),
        );
      },
    );
  }
}
