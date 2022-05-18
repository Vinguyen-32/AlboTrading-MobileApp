
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 1.25,
        right: kDefaultPadding * 1.25,
        bottom: kDefaultPadding / 6,
      ),
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 20,
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ],
        borderRadius: BorderRadius.only(topRight: Radius.circular(17), topLeft: Radius.circular(17))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home_outlined, size: 28, color: textColor,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search_outlined, size: 28, color: textColor,),
            onPressed: () {},
          ),
          Container(
            width: 75,
            height: 45,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add, size: 28, color: Colors.white,),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline, size: 28, color: textColor,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline_outlined, size: 28, color: textColor,),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}