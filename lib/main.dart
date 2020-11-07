import 'package:dark_to_white_switch_app/models/theme_model.dart';
import 'package:dark_to_white_switch_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "dark to white switch",
      home: HomePage(),
      theme: theme.getTheme(),

      //if you like to use systemtheme uncomment below codes
      //themeMode: ThemeMode.system,
      //darkTheme: ThemeData.dark(),
    );
  }
}
