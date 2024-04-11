import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/CustomElevatedButton.dart';

class CollectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Quick Search Collections',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
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
      ),
    );
  }
}
