import 'dart:io';

import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  final File? imageFile;
  final void Function()? closeImageFunction;
  final void Function()? pickImageFunction;

  AddImage(
      {required this.imageFile,
      required this.closeImageFunction,
      this.pickImageFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imageFile == null
            ? Text(getTranslated(context, StringsConstants.choosePhoto)!)
            : Container(),
        Align(
          alignment: Alignment.center,
          child: imageFile != null
              ? Container(
                  height: 180,
                  width: 280,
                  child: Stack(
                    // fit: StackFit.expand,
                    children: [
                      Center(
                        child: Card(
                          elevation: 6,
                          child: Image.file(
                            imageFile!,
                            height: 170,
                            width: 250,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 0,
                        child: Container(
                          height: 22.0,
                          width: 22.0,
                          child: FittedBox(
                            child: FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: closeImageFunction,
                              child: Icon(
                                Icons.close,
                                size: 45,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: pickImageFunction,
                  iconSize: 70,
                ),
        ),
      ],
    );
  }
}
