import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../model/subject_data_model.dart';

class AppDataController extends GetxController {
  List<SubjectModel> subjectData = [];
  List<MultiSelectItem> dropDownData = [];

  getSubjectData() {
    subjectData.clear();
    dropDownData.clear();

    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {"medicine_id": "1", "medicine_name": "Aspirin"},
        {"medicine_id": "2", "medicine_name": "Paracetamol"},
        {"medicine_id": "3", "medicine_name": "Antacid"},
        {"medicine_id": "4", "medicine_name": "Antihistamine"},
        {"medicine_id": "5", "medicine_name": "Nasal decongestants"},
        {"medicine_id": "6", "medicine_name": "Anti-sickness medications"},
        {"medicine_id": "7", "medicine_name": "Omeprazole"},
        {"medicine_id": "8", "medicine_name": "Vitamin D "},
        {"medicine_id": "9", "medicine_name": "Aspirin"},
        {"medicine_id": "10", "medicine_name": "Paracetamol"},
        {"medicine_id": "11", "medicine_name": "Antacid"},
        {"medicine_id": "12", "medicine_name": "Antihistamine"},
        {"medicine_id": "13", "medicine_name": "Nasal decongestants"},
        {"medicine_id": "14", "medicine_name": "Anti-sickness medications"},
      ]
    };

    if (apiResponse['code'] == 200) {
      List<SubjectModel> tempSubjectData = [];
      apiResponse['data'].forEach(
        (data) {
          tempSubjectData.add(
            SubjectModel(
              medicineId: data['medicine_id'],
              medicineName: data['medicine_name'],
            ),
          );
        },
      );
      print(tempSubjectData);
      subjectData.addAll(tempSubjectData);

      dropDownData = subjectData.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.medicineName);
      }).toList();

      update();
    } else if (apiResponse['code'] == 400) {
      print("Show Error model why error occurred..");
    } else {
      print("show some error model like something went worng..");
    }
  }
}
