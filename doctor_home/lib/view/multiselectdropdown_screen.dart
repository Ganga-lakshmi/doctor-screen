import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management_system/screens/doctor/doctor_home/home_screen.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import '../controller/app_data_controller.dart';
import '../model/subject_data_model.dart';

class MultiSelectDropDownScreen extends StatefulWidget {
  const MultiSelectDropDownScreen({Key? key}) : super(key: key);

  //MultiSelectDropDownScreen({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MultiSelectDropDownScreen> {
  final AppDataController controller = Get.put(AppDataController());
  //int _value = 0;
  bool _inj1 = false;
  bool _inj2 = false;
  bool _inj3 = false;
  bool _inj4 = false;
  bool _inj5 = false;
  bool _checkbox = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  List<String> text = ["InduceSmile.com", "Flutter.io", "google.com"];

  @override
  Widget build(BuildContext context) {
    List subjectData = [];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSubjectData();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Prescription"),
      ),
      body: Column(
        children: [
          GetBuilder<AppDataController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: MultiSelectDialogField(
                //height: 200,
                items: controller.dropDownData,
                title: const Text(
                  "Select drug",
                  style: TextStyle(color: Colors.black),
                ),
                selectedColor: Colors.black,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                buttonIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
                buttonText: const Text(
                  "Select the medicine",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  subjectData = [];
                  for (var i = 0; i < results.length; i++) {
                    SubjectModel data = results[i] as SubjectModel;
                    print(data.medicineId);
                    print(data.medicineName);
                    subjectData.add(data.medicineId);
                  }
                  print("data $subjectData");

                  //_selectedAnimals = results;
                },
              ),
            );
          }),
          //injections filed
          Column(
            children: [
              Column(
                children: [
                  Text(
                    'Any Injections or salines required ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[600]!,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _inj1,
                        onChanged: (value) {
                          setState(() {
                            _inj1 = !_inj1;
                            //_checkbox = value!;
                          });
                        },
                      ),
                      const Text('Intramuscular (IM) injections'),
                    ],
                  ),
                  //2nd checkbox
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _inj2,
                        onChanged: (value) {
                          setState(() {
                            _inj2 = !_inj2;
                            // _checkbox = value!;
                          });
                        },
                      ),
                      const Text('Subcutaneous (SC) injections.'),
                    ],
                  ),
                  //2nd checkbox
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _inj3,
                        onChanged: (value) {
                          setState(() {
                            _inj3 = !_inj3;
                            // _checkbox = value!;
                          });
                        },
                      ),
                      const Text(' Intradermal (ID) injections.'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _inj4,
                        onChanged: (value) {
                          setState(() {
                            _inj4 = !_inj4;
                            // _checkbox = value!;
                          });
                        },
                      ),
                      const Text('saline1'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkbox5,
                    onChanged: (value) {
                      setState(() {
                        _inj5 = !_inj5;
                        // _checkbox = value!;
                      });
                    },
                  ),
                  const Text('saline2'),
                ],
              ),
            ],
          ),

          Column(
            children: [
              Text(
                'Any suggestions for good health ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[600]!,
                ),
              ),
            ],
          ),

          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                        //_checkbox = value!;
                      });
                    },
                  ),
                  const Text(
                    'always eat breakfast, never skip meals and snack regularly to avoid hunger',
                  ),
                ],
              ),
              //2nd checkbox
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkbox2,
                    onChanged: (value) {
                      setState(() {
                        _checkbox2 = !_checkbox2;
                        // _checkbox = value!;
                      });
                    },
                  ),
                  const Text(
                      'Make sure to keep hydrated as you go through your day by bringing water with you.'),
                ],
              ),
              //2nd checkbox
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkbox3,
                    onChanged: (value) {
                      setState(() {
                        _checkbox3 = !_checkbox3;
                        // _checkbox = value!;
                      });
                    },
                  ),
                  const Text(' Maintain the Limit for junk food'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkbox4,
                    onChanged: (value) {
                      setState(() {
                        _checkbox4 = !_checkbox4;
                        // _checkbox = value!;
                      });
                    },
                  ),
                  const Text('try to get as much sleep as you need.'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _checkbox5,
                    onChanged: (value) {
                      setState(() {
                        _checkbox5 = !_checkbox5;
                        // _checkbox = value!;
                      });
                    },
                  ),
                  const Text(
                      'Try to eat fruits and veggies and Take vitamins.'),
                ],
              ),
            ],
          ),
          Column(children: const [
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  //labelText: 'Enter Name',
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  hintText: 'others'),
            ),
          ]),
          // Column(
          //   children: [
          //     Text(
          //       "Select in/out patient",
          //       style: TextStyle(
          //         fontSize: 20,
          //         foreground: Paint()
          //           ..style = PaintingStyle.stroke
          //           ..strokeWidth = 6
          //           ..color = Colors.blue[600]!,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 10.0,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     //select in patinet

          //     Row(
          //       children: [
          //         Radio(
          //           value: 1,
          //           groupValue: _value,
          //           onChanged: (value) {
          //             setState(() {
          //               _value = 1;
          //             });
          //           },
          //         ),
          //         SizedBox(
          //           width: 5.0,
          //         ),
          //         Text("radio1"),
          //       ],
          //     ),
          //     //radio2
          //     Row(
          //       children: [
          //         Radio(
          //           value: 2,
          //           groupValue: _value,
          //           onChanged: (value) {
          //             setState(() {
          //               _value = 2;
          //             });
          //           },
          //         ),
          //         SizedBox(
          //           width: 10.0,
          //         ),
          //         Text("radio2"),
          //       ],
          //     )
          //   ],
          // ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                // //const MyApps();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DoctorHomeButton()),
                // );
              },
              child: OutlinedButton(
                child: const Text(
                  "Done",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 24, 120, 199),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DoctorHomeScreen()),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
