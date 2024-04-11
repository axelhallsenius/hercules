import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Quick Search Collections',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add Minor Injuries Procedures here
                },
                child: Container(
                  height: 70, // 设置高度
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Minor Injuries Procedures'),
                      Icon(Icons.download_rounded),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add Burn Injuries Procedures here
                },
                child: Container(
                  height: 70, // 设置高度
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Burn Injuries Procedures'),
                      Icon(Icons.download_rounded),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add Major Injuries Procedures here
                },
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Major Injuries Procedures'),
                      Icon(Icons.download_rounded),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
