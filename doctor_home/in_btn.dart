import 'package:flutter/material.dart';

class DoctorInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('In Patient'),
          centerTitle: true,
        ),
        body:
            Center(child: Text('In patients', style: TextStyle(fontSize: 59))),
      );
}