import 'package:flutter/cupertino.dart';

class TabBarWidget extends StatelessWidget {
  final String title;
  final Icon icon;

  TabBarWidget(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 17),
          ),
          // icon,
        ],
      ),
    );
  }
}
