import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/CustomElevatedButton.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child: Text('Settings', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 45),
              CustomElevatedButton(
                text: 'Add language selector here',
                icon: Icons.language,
                onPressed: () {},
              ),
              SizedBox(height: 10),
              CustomElevatedButton(
                text: 'Add text size selector here',
                icon: Icons.text_fields,
                onPressed: () {},
              ),
              SizedBox(height: 10),
              CustomElevatedButton(
                text: 'Others...',
                onPressed: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
