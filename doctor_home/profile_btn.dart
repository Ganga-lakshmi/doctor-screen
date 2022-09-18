import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/model/doctor_user_model.dart';
import 'package:hospital_management_system/screens/welcome.dart';

class DoctorProfileButton extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<DoctorProfileButton> {
  User? user = FirebaseAuth.instance.currentUser;
  DoctorUserModel loggedInUser = DoctorUserModel();

//getting user values
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("doctors")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = DoctorUserModel.fromMap(value.data());
      setState(() {});
    });
  }

  final double coverHeight = 280; //profile bg height

  final double profileHeight = 144; //pofile height

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          //buildContent(),
          Container(
              //padding: EdgeInsets.only(left: 10, bottom: 90),
              alignment: Alignment.topCenter,
              child: Text(
                // 'Dr. ${loggedInUser.firstName} ${loggedInUser.secondName} ',
                "Dr.Sabitha",
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )),
          Container(
              alignment: Alignment.topCenter,
              child: Text(
                'M.B.B.S Cardiac Specialist ',
              )),
          const SizedBox(
            height: 25,
          ),
          Container(
              //alignment: Alignment.left,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Email',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              //alignment: Alignment.topCenter,
              child: Text(
                '${loggedInUser.email}',
              )),
          //gender field
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Gender',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              //alignment: Alignment.topCenter,
              child: Text(
                // '${loggedInUser.gender}',
                "Female",
              )),
          Container(
              //alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Phone',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              //alignment: Alignment.topCenter,
              child: Text(
                // '${loggedInUser.phoneNumber}',
                "9999999999"
              )),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Qualification',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              //alignment: Alignment.topCenter,
              child: Text(
                // '${loggedInUser.qualification}',
                "M.B.B.S",
              )),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Experience',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              //alignment: Alignment.topCenter,
              child: Text(
                '3 years',
              )),

          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'About',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              //alignment: Alignment.topCenter,
              child: Text(
                'It is a long Established fact that a reader will be distracted by the readable content of a page when looking at its layour...',
              )),
          ActionChip(
              label: Text("Logout"),
              onPressed: () {
                logout(context);
              }),
        ],
      ),
    );
  }

  //function for profile img
  Widget buildTop() {
    final top = coverHeight - profileHeight - 50;
    final bottom = profileHeight / 2; // 50/2
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

//function for content

  // Widget buildContent() => Center(
  //     //padding: EdgeInsets.all(20),
  //     //     Container(
  //     //   child: Text("Full name"),
  //     // ),
  //     );

//for background img
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: SizedBox(
            child: Image.asset(
          "assets/profilegb.jpeg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        )),
      );

//for circle format
  Widget buildProfileImage() => CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage('assets/profile.jpeg'),
        radius: profileHeight - 30,
      );
}

// the logout function
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => Welcome()));
}