import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/search_box.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: SearchBoxWithHistory(
            hintText: 'Start by Typing',
            searchKey: 'dashboard',
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40),
          Wrap(
            spacing: 40, // Setting the space between the tags
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: <Widget>[
              SymptomaticButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    bookmark = !bookmark; // Show or hide the icon.
                  });
                },
                text: 'Obisterics',
              ),
              SymptomaticButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    bookmark = !bookmark; // Show or hide the icon.
                  });
                },
                text: 'Gaming Injury',
              ),
              SymptomaticButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    bookmark = !bookmark; // Show or hide the icon.
                  });
                },
                text: 'Major Owies',
              ),
              SymptomaticButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    bookmark = !bookmark; // Show or hide the icon.
                  });
                },
                text: 'Burn Care',
              ),
              SymptomaticButton(
                onPressed: () {
                  // Action to view specific page.
                },
                onLongPressed: () {
                  setState(() {
                    bookmark = !bookmark; // Show or hide the icon.
                  });
                },
                text: 'Covid',
              ),
            ],
          ),
          SizedBox(height: 30),
          // Button for more categories.
          Center(
            child: SizedBox(
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
              HistoryButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Handling blisters',
              ),
              HistoryButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Talking to Newborns',
              ),
              HistoryButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Article Name',
              ),
              HistoryButton(
                onPressed: () {
                  // Action to view specific page.
                },
                text: 'Rheumatism',
              ),
              HistoryButton(
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

class SymptomaticButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;
  final String text;

  SymptomaticButton(
      {required this.onPressed,
      required this.onLongPressed,
      required this.text});

  @override
  SymptomaticButtonState createState() => SymptomaticButtonState();
}

class SymptomaticButtonState extends State<SymptomaticButton> {
  bool showBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onLongPress: () {
            setState(() {
              showBookmark =
                  !showBookmark; // Toggle the display of the bookmark icon.
            });
            widget.onLongPressed();
          },
          child: Stack(
            alignment: Alignment.center, // Center the icon within the button
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: OutlinedButton(
                  onPressed: widget.onPressed,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(),
                ),
              ),
              if (showBookmark)
                Positioned(
                  left: 4, // Adjust to move icon to the left
                  bottom: 4, // Adjust to move icon to the bottom
                  child: Icon(Icons.bookmark, size: 16), // Smaller icon size
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 8), // Add some spacing between the button and the text
          child: Text(widget.text), // Text is now outside and below the button
        ),
      ],
    );
  }
}

class HistoryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  HistoryButton({
    required this.text,
    required this.onPressed,
  });

  @override
  HistoryButtonState createState() => HistoryButtonState();
}

class HistoryButtonState extends State<HistoryButton> {
  bool showBookmark =
      false; // State variable to control the visibility of the icon

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          showBookmark = !showBookmark; // Toggle the display of the icon
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          OutlinedButton(
            onPressed: widget.onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black),
              minimumSize: Size(50, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(widget.text),
          ),
          if (showBookmark)
            Positioned(
              left: 4,
              bottom: 4,
              child: Icon(Icons.bookmark, size: 16),
            ),
        ],
      ),
    );
  }
}
