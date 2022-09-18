import 'package:flutter/material.dart';

import 'view/multiselectdropdown_screen.dart';
// import 'package:mutiselectdropdown/view/multiselectdropdown_screen.dart';

// void main() {
//   runApp(const MyApps());
// }

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MultiSelectDropDownScreen(),
          );
  }
}
