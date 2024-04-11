import 'package:flutter/material.dart';

class ArticleHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Text('Article History', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Article 1'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Article 2'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Article 3'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('...'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
