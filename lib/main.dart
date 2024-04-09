// Importing material design library from Flutter.
import 'package:flutter/material.dart';

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
      title: 'Flutter Demo', // Title of the app.
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
    SearchPage(),
    CollectionsPage(),
    BookmarkedPage(),
    BurgerMenu(),
    ArticleHistoryPage(),
    SettingsPage(),
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
            icon: Icon(Icons.search),
            label: 'Search',
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

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Start by typing or select tags',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height:
                      5), // Setting the height between the text field and the tags
              Wrap(
                spacing: 6, // Setting the space between the tags
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Mild Pain'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Burn'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Fracture'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('First Aid'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('...'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child: Text('Search', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Start by typing or select tags',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height:
                      5), // Setting the height between the text field and the tags
              Wrap(
                spacing: 6, // Setting the space between the tags
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Mild Pain'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Burn'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Fracture'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('First Aid'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('...'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 30), // Setting the size of the tags
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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

class BookmarkedPage extends StatelessWidget {
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
              child:
                  Text('Bookmarked articles', style: TextStyle(fontSize: 24)),
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

class BurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticleHistoryPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Article history'),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('App settings'),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add text size selector here
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('...'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

class SettingsPage extends StatelessWidget {
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
              child: Text('Settings', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Add language selector here'),
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
                    Text('Add text size selector here'),
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
                    Text('Others...'),
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
