import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RoundShortcutPost extends StatelessWidget {

  // const RoundShortcutPost({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserProfile userProfile = DataProvider().getUserProfileData();
    // TODO: implement build
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x52181818),
                          ),
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: CircleAvatar(
                          // radius: 10,
                          backgroundImage: AssetImage('assets/images/img1.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          // color: kPrimaryColor,
                          // shape: BoxShape.circle,

                          // borderRadius: BorderRadius.circular(20),
                          // border: Border.all(
                          //   color: Theme.of(context).scaffoldBackgroundColor,
                          //   width: 2,
                          // ),

                        ),
                        // child: CircleAvatar(
                        //   // radius: 10,
                        //   backgroundImage: AssetImage('assets/icons/bidding-type.png'),
                        //   backgroundColor: Colors.white,
                        // ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icons/auction.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4,),
                const Text('Dragon Scale ...'),
              ],
            ),
            const SizedBox(width: 14,),
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0x52181818),
                          ),
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: CircleAvatar(
                          // radius: 10,
                          backgroundImage: AssetImage('assets/images/img3.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          // color: kPrimaryColor,
                          // shape: BoxShape.circle,

                          // borderRadius: BorderRadius.circular(20),
                          // border: Border.all(
                          //   color: Theme.of(context).scaffoldBackgroundColor,
                          //   width: 2,
                          // ),

                        ),
                        // child: CircleAvatar(
                        //   // radius: 10,
                        //   backgroundImage: AssetImage('assets/icons/bidding-type.png'),
                        //   backgroundColor: Colors.white,
                        // ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icons/trade.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4,),
                const Text('Clarinervium ...'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}