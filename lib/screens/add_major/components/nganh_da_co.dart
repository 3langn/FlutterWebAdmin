import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_admin/providers/dataMajorsProvider.dart';

class NganhDaCo extends StatelessWidget {
  const NganhDaCo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
