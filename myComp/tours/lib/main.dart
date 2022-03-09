// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'Extra/checkChild.dart';
import 'Mobile/ext.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KhatuShayamji',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(
          builder: (context, constraints) {
            // print(constraints);
            // print(constraints.widthConstraints());
            // print(constraints.maxWidth);
            // print(constraints.minWidth);
            // if (constraints.maxWidth > 760) {
            //   return const Scaffold(
            //     body: Center(
            //       child: Text('Home Page '),
            //     ),
            //   );
            // }
            // return SellerDashboard();
            // return HomePage1();
            return ProductDeatilsScr();
          },
        ));
  }
}
