import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_admin/models/majors.dart';
import 'package:university_admin/screens/add_university/controllers/add_university_controller.dart';

import 'custom_search_majors.dart';

class SearchMajorsDelegate extends CustomSearchDelegate<String> {
  SearchMajorsDelegate({
    required String? hintText,
    required this.scaffoldCtx,
  }) : super(
          searchFieldLabel: hintText,
        );
  final BuildContext? scaffoldCtx;
  final controller = Get.find<AddUniversityController>();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [Container()];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final controller = Get.find<AddUniversityController>();

    final suggestList = [
      ...controller.listMajors.where((element) =>
          element.name.toLowerCase().startsWith(query.toLowerCase()))
    ];
    print(suggestList[0].name + ' - input major');
    return Visibility(
      visible: query.isNotEmpty && suggestList.isNotEmpty,
      child: Card(
        child: Container(
          color: Colors.grey[100],
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  buildShowInputMajors(scaffoldCtx!, suggestList[index]);
                },
                title: Text(suggestList[index].name),
              );
            },
            itemCount: suggestList.length > 5 ? 5 : suggestList.length,
            separatorBuilder: (context, index) {
              return Divider(
                height: 3,
              );
            },
          ),
        ),
      ),
    );
  }

  Future buildShowInputMajors(BuildContext scaffoldCtx, Major major) {
    final focus = FocusNode();

    final scoreController = TextEditingController();
    final codeController = TextEditingController();
    final gradesController = TextEditingController();

    void addListSelected() {
      if (gradesController.text.isNotEmpty) {
        controller.gradesSelected.add(gradesController.text);
        gradesController.clear();
        focus.unfocus();
      }
    }

    void submit() {
      print('${major.id} - in-put major');
      controller.majorsId.add(major.id);
      controller.addMajor(
        name: major.name,
        // score: double.parse(scoreController.text),
        // grades: gradesSelected,
        // code: codeController.text,
      );
      Navigator.pop(scaffoldCtx);
    }

    return showModalBottomSheet(
      context: scaffoldCtx,
      builder: (scaffoldCtx) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 800,
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Điền thông tin ngành',
                    style: Theme.of(scaffoldCtx).textTheme.headline6,
                  ),
                  Text('Tên Ngành : ${major.name}'),
                  TextFormField(
                    controller: codeController,
                    decoration: InputDecoration(
                      labelText: 'Nhập mã ngành',
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          onSubmitted: (_) {
                            addListSelected();
                          },
                          focusNode: focus,
                          controller: gradesController,
                          decoration: InputDecoration(
                            labelText: 'Nhập khối thi',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => addListSelected(),
                      )
                    ],
                  ),
                  Tag(),
                  TextFormField(
                    controller: scoreController,
                    decoration: InputDecoration(
                      labelText: 'Nhập điểm sàn ',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text('Nhập'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Tag extends StatelessWidget {
  final controller = Get.find<AddUniversityController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 100),
        child: Obx(
          () => GridView.builder(
            itemBuilder: (context, index) {
              return _Chip(
                label: controller.gradesSelected[index],
                onDeleted: (index) {},
                index: index,
              );
            },
            itemCount: controller.gradesSelected.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
          ),
        ));
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 20,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
