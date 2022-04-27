import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plant_trading_app/models/Post.dart';

import '../../../constants.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
    required this.press,
  }) : super(key: key);

  final Post post;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.85
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(post.image),
                        ),
                        if(post.isActive)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              post.location,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(post.time),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: false,
                aspectRatio: 1.33,
                viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
              ),
              items:
              post.postImages?.map((i) {
                return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                          child: Image.asset(i),
                          borderRadius: BorderRadius.circular(8)
                      );
                    }
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}