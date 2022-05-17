import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class UserAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return SingleChildScrollView(
    //   child: Column(
      return Column(
        children: <Widget>[
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 5.0),
          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //   color: Colors.white,
          //   child: Column(
          //     children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          // userProfile.profileImage,
                          'assets/images/img.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // const SizedBox(width: 2,),
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vi Nguyen',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'Trading List',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          //     ],
          //   ),
          // ),
        ],
      // ),
    );
  }
}