import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:flutter/material.dart';

class FieldName extends StatelessWidget {
  final Icon icon;
  final String fieldName;
  final String fieldValue;
  final bool hasDivider;

  FieldName(
      {required this.fieldName, required this.icon, required this.fieldValue, this.hasDivider= true});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                    fieldValue,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18)
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Expanded(
              //     child: Container(
              //         child: Column(
              //             children: [
              //               Text("Your text here...",
              //                   overflow: TextOverflow.ellipsis
              //               )
              //             ]
              //         )
              //     )
              // ),
              Container(
                // width: 300,
                child: Text(
                  getTranslated(context, fieldName)!,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              hasDivider ? Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.88,
                  child: Divider(
                    // height: 5,
                    thickness: 1.5,
                    // color: Colors.black,
                  )) : Container()
            ],
          ),
        ],
      ),
    );
  }
}
