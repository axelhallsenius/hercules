import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          // Category section with horizontal scrolling.
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Start by typing or select tags',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20, // Setting the space between the tags
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Container(),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                  Text('Obisteric'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Container(),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                  Text('Gaming Injury'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Container(),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                  Text('Major Owies'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Container(),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                  Text('Burn Care'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Container(),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                    ),
                  ),
                  Text('Covid'),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          // Button for more categories.
          Center(
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Action to expand or view more categories.
                },
                child: Text('More Categories ...'),
              ),
            ),
          ),
          SizedBox(height: 30),
          // History section title.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.access_time),
                SizedBox(width: 18),
                Text('History', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          SizedBox(height: 30),
          // History section with scrollable cards or tiles.
          Wrap(
            spacing: 6, // Setting the space between the tags
            alignment: WrapAlignment.center,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {},
                child: Text('Handling blisters'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  minimumSize: Size(50, 30), // Setting the size of the tags
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Talking to Newborns'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  minimumSize: Size(50, 30), // Setting the size of the tags
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Article Name'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  minimumSize: Size(50, 30), // Setting the size of the tags
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Rheumatism'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  minimumSize: Size(50, 30), // Setting the size of the tags
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Small Owie'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  minimumSize: Size(50, 30), // Setting the size of the tags
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
