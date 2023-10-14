import 'package:flutter/material.dart';
import 'package:persistent/pages/home_page.dart';
import 'package:persistent/persistent/dao/pref_instance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefInstance.createSharePreferencesInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
