
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/doctor/doctor_home/consultant.dart';

class DoctorHomeButton extends StatefulWidget {
  DoctorHomeButton({Key? key}) : super(key: key);

  @override
  _DoctorHomeButtonState createState() => _DoctorHomeButtonState();
}

class _DoctorHomeButtonState extends State<DoctorHomeButton> {
  _DoctorHomeButtonState();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('appointments').snapshots();
  // Map<String, dynamic>? userdata1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("no appointments"),
                );
              } else {
                return SafeArea(
                    child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Hello!",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Dr.Arun Kumar,",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: Text("M.sc,Md."),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image.asset(
                                  'assets/logo.png',
                                  height: 100,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var reserveIndex =
                              snapshot.data!.docs.length - index - 1;

                          var ds = snapshot.data!.docs[reserveIndex];
                          // FirebaseFirestore.instance
                          //     .collection("students")
                          //     .doc(snapshot.data!.docs[reserveIndex]["aid"])
                          //     .get()
                          //     .then((value) {
                          //   if (value != null) {
                          //     userdata1 = value.data();

                          //   }
                          // });

                          // snapshot.data!.docs[reserveIndex]["uid"]
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorConsultant()),
                              );
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                // backgroundImage: NetworkImage("https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fsmiling-female-doctor-holding-medical-records-lab-coat-her-office-clipboard-looking-camera-56673035.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fdoctor.html&tbnid=EycEseRDhNp2DM&vet=12ahUKEwiv4NfF28b5AhXfktgFHRfnAzcQMygAegUIARC6AQ..i&docid=cREmzhIXVvISOM&w=800&h=488&q=doctor%20image%20download&client=ubuntu&ved=2ahUKEwiv4NfF28b5AhXfktgFHRfnAzcQMygAegUIARC6AQ"),
                                backgroundColor: Colors.purpleAccent,
                              ),
                              title: Text(
                                ds["fullName"],
                                style: TextStyle(
                                  // fontFamily:'RobotoMono',
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                ds["temp"],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                      ),
                    )),
                  ],
                ));
              }
            })
            );
  }
}
