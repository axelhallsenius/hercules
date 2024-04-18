import 'package:flutter/material.dart';
import 'package:flutter_application_1/elements/custom_elevated_button.dart';
import 'article_history_page.dart';
import 'settings_page.dart';

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
          ListView(
            children: <Widget>[
              SizedBox(height: 40),
              CustomElevatedButton(
                text: 'Articles History',
                icon: Icons.history,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleHistoryPage()),
                  );
                },
              ),
              SizedBox(height: 10),
              CustomElevatedButton(
                text: 'App Settings',
                icon: Icons.settings,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
              SizedBox(height: 10),
              CustomElevatedButton(
                text: 'Clear Cache',
                icon: Icons.delete,
                onPressed: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
