import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/custom_elevated_button.dart';
import 'package:flutter_application_1/elements/search_box.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';

//class BookmarkedPage extends StatelessWidget {
  //final Future<List<String>> bookmarks;

  //BookmarkedPage() : bookmarks = _fetchBookmarks();

  //static Future<Database> openDatabaseFromAssets() async {
    //// Search for the database file in the application documents directory
    //Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //String path = join(documentsDirectory.path, "hercules.db");

    //// Check if the database exists
    //bool dbExists = await File(path).exists();
    //print("Database exists: $dbExists at $path");

    //// If the database does not exist, load it from the Flutter assets
    //if (!dbExists) {
      //// Load the database file as a byte data
      //ByteData data = await rootBundle.load("assets/db/hercules.db");
      //List<int> bytes =
          //data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //// Write the database file to the application documents directory
      //await File(path).writeAsBytes(bytes, flush: true);
    //}

    //// Open the database and return it
    //return await openDatabase(path);
  //}

  //static Future<List<String>> _fetchBookmarks() async {
  //  try {
  //    var db = await openDatabaseFromAssets();
  //    List<Map> result =
  //        await db.rawQuery('SELECT * FROM ARTICLES WHERE bookmark > 0');

  //    //fetch these articles
  //    print(result);
  //    if (result.isEmpty) {
  //      return [];
  //    }

  //    return result.map((row) => row['name'].toString()).toList();
  //  } catch (e) {
  //    print('Error fetching collections: $e');
  //    return [];
  //  }
  //}


class BookmarkedPage extends StatefulWidget {
  @override
  _BookmarkedPageState createState() => _BookmarkedPageState();
}
class _BookmarkedPageState extends State<BookmarkedPage> {
  late SharedPreferences prefs;
  //await prefs.setStringList('bookmarks', <String>["Self inflicted headaches", "Snail Surgery"]);

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  late List<String>? bookmarks;

  void getBookmarks() async {
    prefs.setStringList('bookmarks', <String>["Self inflicted headaches", "Snail Surgery"]);
    bookmarks = prefs.getStringList('bookmarks');
    print(bookmarks);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: Column(
        children: [
          SizedBox(height: 45), // Add a SizedBox between AppBar and body
          Expanded(
            child: FutureBuilder<List<String>>(
              future: Future.value(bookmarks),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // If an error occurred while fetching the data
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data != null &&
                      snapshot.data!.isNotEmpty) {
                    // If the data was fetched successfully
                    return ListView(
                      children: snapshot.data!
                          .map((name) => Column(
                        children: [
                          CustomElevatedButton(
                            text: name,
                            onPressed: () {},
                          ),
                          SizedBox(
                              height:
                              10), // Add a SizedBox after each button
                        ],
                      ))
                          .toList(),
                    );
                  }
                }
                // If none of the above conditions are met, return a CircularProgressIndicator
                return CircularProgressIndicator();
              },
            ),
          ),
        ],

      )
    );
  }

}


/*

class BookmarkedPage extends StatelessWidget {
  //TODO: Its late and I couldn't figure out a better way to do this atm
  //Could we do a first startup thing, or just detect if there is no cache or something?
  static Future<void> setBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarks', <String>["Self inflicted headaches", "Snail Surgery"]);
  } 

  final Future<List<String>> bookmarks;
  BookmarkedPage() : bookmarks = _fetchBookmarks();

  static Future<List<String>> _fetchBookmarks() async {
    setBookmarks();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      //get array from app cache
      return Future.value(prefs.getStringList('bookmarks'));
    }
    catch(e) {
      print('Error fetching bookmarks: $e');
      return[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: SearchBoxWithHistory(
              hintText: 'Quick Search Bookmarks', searchKey: 'bookmarks'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 45), // Add a SizedBox between AppBar and body
          Expanded(
            child: FutureBuilder<List<String>>(
              future: bookmarks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // If an error occurred while fetching the data
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data != null &&
                      snapshot.data!.isNotEmpty) {
                    // If the data was fetched successfully
                    return ListView(
                      children: snapshot.data!
                          .map((name) => Column(
                                children: [
                                  CustomElevatedButton(
                                    text: name,
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                      height:
                                          10), // Add a SizedBox after each button
                                ],
                              ))
                          .toList(),
                    );
                  }
                }
                // If none of the above conditions are met, return a CircularProgressIndicator
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/