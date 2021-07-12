import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:university_admin/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:university_admin/screens/add_university/controllers/add_university_controller.dart';
import 'package:university_admin/services/majors/custom_search_majors.dart';
import 'package:university_admin/services/majors/input_majors.dart';

class AddUniversity extends GetView<AddUniversityController>
    with NavigationStates {
  static const routeName = 'Add-university-screen';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(AddUniversityController());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Thêm thông tin trường'),
      ),
      body: GetBuilder<AddUniversityController>(
        init: AddUniversityController(),
        builder: (controller) {
          return Column(children: [
            Form(
              key: controller.form,
              child: Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 300.0, vertical: 50.0),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nhập tên trường'),
                      onSaved: (value) => controller.tenTruong = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nhập mã trường'),
                      onSaved: (value) => controller.maTruong = value!,
                    ),
                    Row(
                      children: [
                        Text('Là đại học quốc gia ?'),
                        Obx(
                          () => Switch(
                            value: controller.isNationalUniversity.value,
                            onChanged: (value) {
                              controller.isNationalUniversity.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SearchPage(
                      delegate: SearchMajorsDelegate(
                        hintText: 'Chọn ngành',
                        scaffoldCtx: context,
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.listMajorsSelected.isNotEmpty,
                        child: Column(
                          children: [
                            Text('Ngành đã thêm :' +
                                '${controller.listMajorsSelected.length}'),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Container(
                                child: Row(
                                  children: [
                                    Text(
                                      '${index + 1}.' +
                                          controller.listMajorsSelected[index],
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        controller.removeMajor(
                                          controller.listMajorsSelected[index],
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              itemCount: controller.listMajorsSelected.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: 'Học phí tối thiểu'),
                      onSaved: (value) =>
                          controller.minTuition = double.parse(value!),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Học phí tối đa'),
                      onSaved: (value) =>
                          controller.maxTuition = double.parse(value!),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Địa chỉ'),
                      onSaved: (value) => controller.diaChi = value!,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Loai truong (cong,tu..)'),
                      onSaved: (value) => controller.universityType = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nhập link website của trường'),
                      onSaved: (value) => controller.linkWeb = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nhập link ảnh'),
                      onSaved: (value) => controller.linkAnh = value!,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: controller.setData,
                      child: Text('Xong'),
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
