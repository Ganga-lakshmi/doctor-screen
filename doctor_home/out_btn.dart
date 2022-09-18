import 'package:flutter/material.dart';

class DoctorOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Out Patient'),
          centerTitle: true,
        ),
        body:
            Center(child: Text('Out Patients', style: TextStyle(fontSize: 59))),
      );
}