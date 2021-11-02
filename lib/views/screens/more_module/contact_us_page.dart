import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:customer_end/widgets/form_input.dart';
import 'package:customer_end/widgets/rounded_edge_button.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  final FocusNode _subjectFocusNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text("Contact Us"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: Dimensions.pixels_16,
          right: Dimensions.pixels_16,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: Dimensions.pixels_22,
            ),
            Icon(
              Icons.message,
              size: Dimensions.pixels_50,
              color: orange,
            ),
            Center(
              child: Text(
                "Give us your feedback",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.pixels_18,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: Dimensions.pixels_30,
            ),
            FormInput(
              label: "Enter Subject",
              onChanged: (value) {},
              focusNode: _subjectFocusNode,
            ),
            SizedBox(
              height: Dimensions.pixels_10,
            ),
            FormInput(
              label: "",
              onChanged: (value) {},
              focusNode: _descriptionNode,
              textFieldHeight: Dimensions.pixels_125,
            ),
            SizedBox(
              height: Dimensions.pixels_30,
            ),
            RoundedEdgeButton(
                height: Dimensions.pixels_56,
                color: Colors.orange,
                text: "Send message",
                textColor: Colors.white,
                textFontSize: Dimensions.pixels_16,
                onPressed: (_) {},
                buttonRadius: Dimensions.pixels_8,
                context: context),
            SizedBox(
              height: Dimensions.pixels_20,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: orange,
                    height: Dimensions.pixels_2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.pixels_5, right: Dimensions.pixels_5),
                  child: Text(
                    "Or contact us by",
                    style: TextStyle(
                        color: primaryColor, fontSize: Dimensions.pixels_12),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: orange,
                    height: Dimensions.pixels_2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.pixels_20,
            ),
            Row(
              children: [
                Expanded(
                  child: RoundedEdgeButton(
                      height: Dimensions.pixels_50,
                      color: Colors.green.withOpacity(0.5),
                      text: "Whatsapp",
                      textColor: Colors.white,
                      buttonRadius: Dimensions.pixels_12,
                      textFontSize: Dimensions.pixels_12,
                      onPressed: (_) {},
                      context: context),
                ),
                SizedBox(width: Dimensions.pixels_20,),
                Expanded(
                  child: RoundedEdgeButton(
                      height: Dimensions.pixels_50,
                      color: Colors.blueAccent.withOpacity(0.5),
                      textColor: Colors.white,
                      buttonRadius: Dimensions.pixels_12,
                      textFontSize: Dimensions.pixels_12,
                      text: "Call us",
                      onPressed: (_) {},
                      context: context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
