import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/custom_elevated_button.dart';
import 'package:flutter_application_1/elements/search_box.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class CollectionArticlePage extends StatefulWidget {
  final String collectionName;
  CollectionArticlePage({required this.collectionName});
  @override
  CollectionArticlePageState createState() => CollectionArticlePageState();
}

class CollectionArticlePageState extends State<CollectionArticlePage> {
  late Future<List<String>> articles;
  List<String> filteredArticles = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    articles = _fetchArticles(widget.collectionName).then((list) {
      filteredArticles = List.from(list);
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

  static Future<List<String>> _fetchArticles(String collectionName) async {
    try {
      var db = await openDatabaseFromAssets();
      List<Map> result = await db
          .query('COLLECTIONS', where: 'name = ?', whereArgs: [collectionName]);

      if (result.isEmpty) {
        return [];
      }

      int orderNumber = result.first['order_number'];

      List<Map> articlesResult = await db.query('ARTICLES',
          where: 'order_number = ?', whereArgs: [orderNumber]);

      return articlesResult.map((row) => row['name'].toString()).toList();
    } catch (e) {
      print('Error fetching articles: $e');
      return [];
    }
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      articles.then((list) {
        // Filter the articles based on the search query
        filteredArticles = list
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.collectionName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SearchBoxWithHistory(
                hintText: 'Quick Search Articles',
                searchKey: 'articles',
                onSearch: _updateSearchQuery,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: articles,
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
                                          onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
