import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShowCustomDatePicker {
  // showCupertinoModalPopup is a built-in function of the cupertino library
  void showDatePicker(
      BuildContext context, Function selectedDate, Function onDone) {
    String userSelectedDate = '';
    showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (_) => Container(
              height: 350,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Get.back();
                        selectedDate(userSelectedDate);
                      },
                    ),
                  ),
                  Container(
                    height: 250,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime(1969, 1, 1),
                        onDateTimeChanged: (val) {
                          userSelectedDate = val.toString();
                          /*selectedDate(val);*/
                          /*setState(() {
                         _birthdayController.text =
                             DateFormat('yyyy-MM-dd').format(val);
                       });*/
                        }),
                  ),

                  // Close the modal
                ],
              ),
            ));
  }
}
