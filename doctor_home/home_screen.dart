import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/doctor/doctor_home/home_btn.dart';
import 'package:hospital_management_system/screens/doctor/doctor_home/in_btn.dart';
import 'package:hospital_management_system/screens/doctor/doctor_home/out_btn.dart';
import 'package:hospital_management_system/screens/doctor/doctor_home/profile_btn.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DoctorHomeScreen> {
  // User? doctor = FirebaseAuth.instance.currentUser;
  // DoctorUserModel loggedInUser = DoctorUserModel();

  int currentIndex = 0; // default homepage
  final screens = [
    DoctorHomeButton(),
    DoctorOutButton(),
    DoctorProfileButton()
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Screen"),
      //   centerTitle: true,
      // ),
      body: screens[currentIndex], //body move to correct page
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 119, 12, 138),
          selectedItemColor: const Color.fromARGB(234, 194, 103, 247),
          unselectedItemColor: Colors.white,
          // showSelectedLabels: false,
          iconSize: 25,
          // selectedFontSize: 20,
          // unselectedFontSize: 15,
          currentIndex: currentIndex, //to select the icons
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.purple,
              //     onPressed: () {
              //   HomeScreen();
              // },
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.arrow_downward),
            //   label: 'In Patient',
            //   backgroundColor: Colors.purple,
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward),
              label: 'completed list',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.purple,
            ),
          ]),
    );
  }

  // // the logout function
  // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => LoginScreen()));
  // }
}
