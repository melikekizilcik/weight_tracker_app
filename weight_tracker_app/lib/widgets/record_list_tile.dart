import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker_app/models/record.dart';
import 'package:weight_tracker_app/view-models/controller.dart';

class RecordListTile extends StatelessWidget {
  final Record record;
  RecordListTile({Key? key, required this.record}) : super(key: key);
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        child: ListTile(
          leading: buildDate(),
          title: buildWeight(),
          trailing: buildIcons(),
        ),
      ),
    );
  }

  Row buildIcons() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
          onPressed: null,
          icon: Icon(
            Icons.edit,
            color: Colors.grey,
          )),
      IconButton(
          onPressed: () {
            _controller.deleteRecord(record);
          },
          icon: Icon(Icons.delete, color: Colors.red)),
    ]);
  }

  Center buildWeight() {
    return Center(
        child: Text("${record.weight}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )));
  }

  Text buildDate() => Text(DateFormat("EEE, MMM, d").format(record.dateTime));
}
