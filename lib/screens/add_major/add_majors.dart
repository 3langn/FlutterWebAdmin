import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_admin/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:university_admin/providers/dataMajorsProvider.dart';

import 'components/emulation.dart';
import 'components/input_field.dart';
import 'components/nganh_da_co.dart';

class AddMajors extends StatefulWidget with NavigationStates {
  static const routeName = 'add-majors-screen';
  const AddMajors({Key? key}) : super(key: key);

  @override
  _AddMajorsState createState() => _AddMajorsState();
}

class _AddMajorsState extends State<AddMajors> {
  final _form = GlobalKey<FormState>();
  int _itemCount = 1;
  List<String?> majorsList = [];
  List<Row> listRow = [];
  void _submit() async {
    _form.currentState!.save();
    try {
      String content = majorsList.join(", ");

      majorsList.forEach((majors) async {
        await FirebaseFirestore.instance
            .collection('listMajors')
            .add({
              'majors': majors,
              'hot': true,
            })
            .then((value) => {
                  print(content),
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đã thêm $content'),
                    ),
                  )
                })
            .catchError((e) {
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Đã xảy ra lỗi vui lòng thử lại'),
                ),
              );
            });
      });
      setState(() {
        majorsList.clear();
        _itemCount = 0;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    Provider.of<DataMajorsProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
  }
}
