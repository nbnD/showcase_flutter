import 'package:flutter/material.dart';
import 'package:showcase_flutter/homepage.dart';
import 'package:showcaseview/showcaseview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter ShowCase',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(4, 43, 89, 1),
        ),
        debugShowCheckedModeBanner: false,
        home: ShowCaseWidget(
            builder: Builder(builder: (context) => const HomePage())));
  }
}
