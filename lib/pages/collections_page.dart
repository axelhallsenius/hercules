import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/custom_elevated_button.dart';
import 'package:flutter_application_1/elements/search_box.dart';

class CollectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: SearchBoxWithHistory(
              hintText: 'Quick Search Collections', searchKey: 'collections'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          CustomElevatedButton(
            text: 'Minor Injuries Procedures',
            icon: Icons.download,
            onPressed: () {},
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
            text: 'Procedures 2',
            icon: Icons.download,
            onPressed: () {},
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
            text: 'Procedures 3',
            icon: Icons.download,
            onPressed: () {},
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
            text: '...',
            icon: Icons.download,
            onPressed: () {},
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
