// Importing material design library from Flutter.
import 'package:flutter/material.dart';
import 'pages/DashboardPage.dart';
import 'pages/CollectionsPage.dart';
import 'pages/BookmarkedPage.dart';
import 'pages/BurgerMenu.dart';

// The main function of the app, which is the entry point.
void main() {
  runApp(MyApp()); // Running the app with MyApp as the root widget.
}

// MyApp class that creates the app structure.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp widget is used as the root of your app.
    return MaterialApp(
      title: 'Hercules App', // Title of the app.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Theme color of the app.
      ),
      home: MyHomePage(), // Specifies the home page of the app.
    );
  }
}

// MyHomePage class that creates the home page.
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(); // Creating state for the widget.
}

// State class for MyHomePage.
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex =
      0; // Index to track the selected item in the bottom navigation bar.

  // List of widgets to display based on the selected item in the bottom navigation bar.
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    CollectionsPage(),
    BookmarkedPage(),
    BurgerMenu(),
  ];

  // Function to handle item tap on the bottom navigation bar.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Updating the selected index with the new index.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hercules'), // AppBar title.
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Navigating to the BurgerMenu page when the menu icon is pressed.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BurgerMenu()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions
            .elementAt(_selectedIndex), // Displaying the selected page.
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Collections list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarked',
          ),
        ],
        currentIndex: _selectedIndex, // Current selected index.
        selectedItemColor: Colors.amber[800], // Color of the selected item.
        onTap: _onItemTapped, // Handling item tap.
      ),
    );
  }
}
