import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_admin/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:university_admin/providers/dataMajorsProvider.dart';

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
          Container(
            padding: EdgeInsets.all(size.width * 0.05),
            width: size.width * 0.7,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _form,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final ctl = TextEditingController();
                      listRow.add(
                        _buildTextField(ctl, index),
                      );
                      return listRow[index];
                    },
                    itemCount: _itemCount,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _itemCount++;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text('Thêm ngành'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text('Gửi'),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(size.width * 0.005),
            width: size.width * 0.15,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    'Các ngành đã có',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  Consumer<DataMajorsProvider>(builder: (context, data, ch) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data.listDataMajors[index]),
                        );
                      },
                      itemCount: data.listDataMajors.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildTextField(TextEditingController ctl, int index) {
    //Todo add textfield for image url and hot
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
              majorsList.add(value);
            },
            onFieldSubmitted: (_) {
              setState(() {
                _itemCount++;
              });
            },
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _itemCount--;
              listRow.removeAt(index);
            });
          },
          icon: Icon(Icons.remove_circle_outline),
        )
      ],
    );
  }
}
