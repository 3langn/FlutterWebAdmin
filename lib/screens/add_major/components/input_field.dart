import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  CustomTextField(label: 'Nhập tên ngành'),
                  TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Nhập code html',
                    ),
                  ),
                  CustomTextField(label: 'Nhập link nguồn'),
                  TextField(),
                  TextField(),
                  TextField(),
                  TextField(),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: ElevatedButton(
                onPressed: () {}, //_submit,
                child: Text('Gửi'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
    );
  }
}
