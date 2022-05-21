import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox ({
    Key? key,
    required this.size,
  }): super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: EdgeInsets.only(bottom: kDefaultPadding * 1.25),
      // It will cover 20% of total height
      height: size.height * 0.1,
      child: Stack (
        children: <Widget>[
          Container (
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              // bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.1 - 30,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ), // BorderRadius.only
            ),
            // child: Row(
            //   children: <Widget>[
            //     Text(
            //       'Hi AlboTrader!',
            //       style: Theme.of(context).textTheme.headline5?.copyWith(
            //           color: Colors.white, fontWeight: FontWeight.bold),
            //     ),
            //     Spacer(),
            //   ],
            // ),
          ),
          Positioned(
            bottom: size.height * 0.01,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height:54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: kPrimaryColor.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}