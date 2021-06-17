import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_admin/screens/add_major/controllers/add_major_controller.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<AddMajorController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: 'Nhập tên ngành',
                      controller: controller.majorName,
                    ),
                    CustomTextField(
                      label: 'Nhập link ảnh',
                      controller: controller.imageUrl,
                    ),
                    CustomTextField(
                      label: 'Nhập description',
                      controller: controller.description,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nhập code HTML',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      maxLines: 13,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      onChanged: (value) => controller.codeHtml.value = value,
                    ),
                    CustomTextField(
                      label: 'Nhập link nguồn',
                      controller: controller.linkRoot,
                    ),
                    Obx(() {
                      return CheckboxListTile(
                        title: Text('Is Hot ?'),
                        value: controller.isHot.value,
                        onChanged: (bool? value) {
                          controller.isHot.value = value!;
                        },
                      );
                    })
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    controller.onSubmitTextField();
                  }, //_submit,
                  child: Text('Gửi'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);
  late final Rx<String> controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
          onChanged: (value) => controller.value = value,
        ),
      ],
    );
  }
}
