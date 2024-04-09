import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    SearchPage(),
    CollectionsPage(),
    BookmarkedPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hercules'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
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
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add Minor Injuries Procedures here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Minor Injuries Procedures'),
                    Icon(Icons.download_rounded),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add Burn Injuries Procedures here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Burn Injuries Procedures'),
                    Icon(Icons.download_rounded),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add Major Injuries Procedures here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Major Injuries Procedures'),
                    Icon(Icons.download_rounded),
                  ],
                ),
              ),
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
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            child: Text('Collections', style: TextStyle(fontSize: 24)),
          ),
        ),
        Center(),
      ],
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 设置为返回图标
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
                    // TODO: Add language selector here
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Add language selector here'),
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
                        Text('Add text size selector here'),
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
