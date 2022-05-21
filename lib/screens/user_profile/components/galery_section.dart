import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class GalerySection extends StatelessWidget {
  final UserProfile userProfileData;

  GalerySection(this.userProfileData);

  @override
  Widget build(BuildContext context) {
    List<String> galeryImages = (userProfileData.galeryImages ?? []);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          'assets/icons/grid-galery.png',
                          height: 24,
                          width: 24,
                        ),
                        const Spacer(),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ],
                    )
                ),
                Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          'assets/icons/feed-galery.png',
                          height: 24,
                          width: 24,
                        ),
                        const Spacer(),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) => Container(
              color: kPrimaryColor,
              child: Image.network(
                galeryImages[index],
              ),
            ),
            itemCount: galeryImages.length,
          ),
        ],
      ),
    );
  }
}