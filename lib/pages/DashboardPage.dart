import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  bool showBookmard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // Category section with horizontal scrolling.
          SizedBox(height: 20),
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
            spacing: 40, // Setting the space between the tags
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: <Widget>[
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: OutlinedButton(
                            onPressed: () {
                              // Action to view specific page.
                            },
                            child: Container(),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        Text('Obisteric'),
                        if (showBookmard)
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Icon(Icons.bookmark, size: 16),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                child: Stack(
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
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        Text('Gaming Injury'),
                        if (showBookmard)
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Icon(Icons.bookmark, size: 16),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                child: Stack(
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
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        Text('Major Owies'),
                        if (showBookmard)
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Icon(Icons.bookmark, size: 16),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                child: Stack(
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
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        Text('Burn Care'),
                        if (showBookmard)
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Icon(Icons.bookmark, size: 16),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                child: Stack(
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
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        Text('Covid'),
                        if (showBookmard)
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Icon(Icons.bookmark, size: 16),
                          ),
                      ],
                    ),
                  ],
                ),
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
