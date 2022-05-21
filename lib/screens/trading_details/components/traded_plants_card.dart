import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TrandedPlantsCard extends StatelessWidget {
  const TrandedPlantsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.account,
    required this.press,
  }) : super(key: key);

  final String image, title, account;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          // Image.assets goes here
          // Image.asset(image),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 8),
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: kPrimaryColor.withOpacity(0.15),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(
                //   color: Color(0xFFD6D6D6),
                //   width: 0.3,
                // ),
                // border: Border(
                //   left: BorderSide(
                //     color: Color(0xFFD6D6D6),
                //     width: 0.3,
                //   ),
                //   right: BorderSide(
                //     color: Color(0xFFD6D6D6),
                //     width: 0.3,
                //   ),
                //   bottom: BorderSide(
                //     color: Color(0xFFD6D6D6),
                //     width: 0.3,
                //   ),
                // ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 8),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: kPrimaryColor.withOpacity(0.15),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(),
                        TextSpan(
                          text: "$account",
                          style: TextStyle(
                            // color: kPrimaryColor.withOpacity(0.5),
                            color: Color(0xFF202124).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Text(
                  //   '\$$price',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .button
                  //       ?.copyWith(color: kPrimaryColor),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}