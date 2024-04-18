import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/custom_elevated_button.dart';
import 'package:flutter_application_1/elements/search_box.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'collection_article_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class CollectionsPage extends StatefulWidget {
  @override
  CollectionsPageState createState() => CollectionsPageState();
}

class CollectionsPageState extends State<CollectionsPage> {
  late Future<List<String>> collections;
  List<String> filteredCollections = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    collections = _fetchCollections().then((list) {
      filteredCollections = List.from(list);
      return list;
    });
  }

  static Future<Database> openDatabaseFromAssets() async {
    // Search for the database file in the application documents directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "hercules.db");

    // Check if the database exists
    bool dbExists = await File(path).exists();
    print("Database exists: $dbExists at $path");

    // If the database does not exist, load it from the Flutter assets
    if (!dbExists) {
      // Load the database file as a byte data
      ByteData data = await rootBundle.load("assets/db/hercules.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write the database file to the application documents directory
      await File(path).writeAsBytes(bytes, flush: true);
    }

    // Open the database and return it
    return await openDatabase(path);
  }

  static Future<List<String>> _fetchCollections() async {
    try {
      var db = await openDatabaseFromAssets();
      List<Map> result = await db.query('COLLECTIONS');

      if (result.isEmpty) {
        return [];
      }

      return result.map((row) => row['name'].toString()).toList();
    } catch (e) {
      print('Error fetching collections: $e');
      return [];
    }
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      collections.then((list) {
        // Filter the collections based on the search query
        filteredCollections = list
            .where(
                (item) => item.toLowerCase().contains(newQuery.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.only(top: 5),
        child: SearchBoxWithHistory(
          hintText: 'Quick Search Collections',
          searchKey: 'collections',
          onSearch: _updateSearchQuery,
        ),
      )),
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        child: FutureBuilder<List<String>>(
          future: collections,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView(
                  children: snapshot.data
                          ?.where((name) => name.contains(searchQuery))
                          .map((name) => Column(
                                children: [
                                  CustomElevatedButton(
                                    text: name,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CollectionArticlePage(
                                                  collectionName: name),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ))
                          .toList() ??
                      [],
                );
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
