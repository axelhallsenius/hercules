import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/custom_elevated_button.dart';

class BookmarkedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child:
                    Text('Bookmarked articles', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 45),
              CustomElevatedButton(
                text: 'Article 1',
                onPressed: () {},
              ),
              SizedBox(height: 15),
              CustomElevatedButton(
                text: 'Article 2',
                onPressed: () {},
              ),
              SizedBox(height: 15),
              CustomElevatedButton(
                text: 'Article 3',
                onPressed: () {},
              ),
              SizedBox(height: 15),
              CustomElevatedButton(
                text: '...',
                onPressed: () {},
              ),
              SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
