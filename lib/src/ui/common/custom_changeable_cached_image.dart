import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomChangeableCachedImage extends StatelessWidget {
  final String image;
  final Function () onChangeImagePressed;

  CustomChangeableCachedImage(
      {required this.image, required this.onChangeImagePressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: image,
          ),
        ),
        Positioned.fill(
          right: 5,
          child: Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue.shade300,
              child: IconButton(
                onPressed: () {
                  onChangeImagePressed();
                  // showConfirmDialogue(ConfirmationType.image);
                },
                icon: Icon(
                  Icons.add_a_photo_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                // color: Colors.blue.shade400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
