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
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final ctl = TextEditingController();
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (ctl.text.trim().isEmpty)
                              return 'Vui lòng nhập vào trường này';
                            return null;
                          },
                          controller: ctl,
                          decoration: InputDecoration(labelText: 'Tên ngành'),
                          onSaved: (value) {
                            //majorsList.add(value);
                          },
                          onFieldSubmitted: (_) {
                            // setState(() {
                            // });
                          },
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 1,
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
