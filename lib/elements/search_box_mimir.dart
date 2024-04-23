import 'dart:ffi';

import 'package:flutter/material.dart'
import 'package:mimir/mimir.dart'

class SearchBoxMimir extends StatefulWidget {
  final String hintText;
  final String searchKey;
  //creating an index
  
  //final MimirIndex index;

  Future<void> buildSearchIndex(String path, DynamicLibrary lib) async {
    final instance = await Mimir.getInstance(path: path, library: lib);
    final index = instance.getIndex('articles');
  }

  @override
  SearchBoxMimir createState() => SearchBoxMimirState();
  


  Future<void> run(String path, DynamicLibrary lib) async {
    final instance = await Mimir.getInstance(path: path, library: lib);
    final index = instance.getIndex('articles');
  
    final article_stream = index.searchStream(
      query: 'a query string',
      filter: null,//
      sortBy: [

        ],
      resultsLimit: 5, //max number of results
      matchingStrategy: null,
  );
  
  await index.updateSettings(
    // By default, mimir allows you to search by any fields in the documents
    // you add to an index. While this is convenient, it can often use more
    // memory than is really required on a device. To improve effeciency,
    // let's specify that we only need to search by the title here.
    // To revert this behavior and search by all fields, set this to null.
    searchableFields: ['title', 'subtitle', 'subsubtitle'],
  );
  }
  
}

class SearchBoxMimirState extends State<SearchBoxMimir> {
  final _textFieldKey = GlobalKey();
  
}