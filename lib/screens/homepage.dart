import 'package:dark_to_white_switch_app/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return SafeArea(
      top: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        appBar: AppBar(
          brightness: MediaQuery.platformBrightnessOf(context),
          centerTitle: true,
          title: Text(
            "Theme Switcher",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Press the button below to toggle"),
              ),
              ChoiceChip(
                backgroundColor: Colors.black,
                label: Text(
                  "Dark",
                  style: TextStyle(color: Colors.white),
                ),
                selected: _selected,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                selectedColor: Colors.green,
                onSelected: (bool value) {
                  value
                      ? theme.setTheme(ThemeData.light())
                      : theme.setTheme(ThemeData.dark());
                  setState(() {
                    _selected = value;
                  });
                },
              )
            ],
          ),
        ),
        resizeToAvoidBottomPadding: true,
      ),
    );
  }
}
