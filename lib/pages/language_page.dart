import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/elements/custom_elevated_button.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale(String languageCode) {
    if (_locale.languageCode != languageCode) {
      // Check if the new language code is different
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }
}

class LanguagePage extends StatefulWidget {
  @override
  LanguagePageState createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    // Access the provider
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 45),
          CustomElevatedButton(
            text: 'English',
            onPressed: () {
              languageProvider.setLocale('en');
            },
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
            text: '中文',
            onPressed: () {
              languageProvider.setLocale('zh');
            },
          ),
        ],
      ),
    );
  }
}
