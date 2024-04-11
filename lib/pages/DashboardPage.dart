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
              BookmarkableButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                text: 'Obisterics',
              ),
              BookmarkableButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                text: 'Gaming Injury',
              ),
              BookmarkableButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                text: 'Major Owies',
              ),
              BookmarkableButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                text: 'Burn Care',
              ),
              BookmarkableButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    showBookmard = !showBookmard; // Show or hide the icon.
                  });
                },
                text: 'Covid',
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
              CustomOutlinedButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Handling blisters',
              ),
              CustomOutlinedButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Talking to Newborns',
              ),
              CustomOutlinedButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Article Name',
              ),
              CustomOutlinedButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Rheumatism',
              ),
              CustomOutlinedButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Small Owie',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BookmarkableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;
  final String text;

  BookmarkableButton(
      {required this.onPressed,
      required this.onLongPressed,
      required this.text});

  @override
  _BookmarkableButtonState createState() => _BookmarkableButtonState();
}

class _BookmarkableButtonState extends State<BookmarkableButton> {
  bool showBookmark = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          showBookmark = !showBookmark; // Show or hide the icon.
        });
        widget.onLongPressed();
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
                  onPressed: widget.onPressed,
                  child: Container(),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              Text(widget.text),
              if (showBookmark)
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Icon(Icons.bookmark, size: 16),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomOutlinedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.black),
        minimumSize: Size(50, 30), // Setting the size of the tags
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}
