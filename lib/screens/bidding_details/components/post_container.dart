import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/Post.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../constants.dart';
import '../../user_profile/user_profile_screen.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return /*Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: */
        Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(post.avatar == ''
                            ? 'https://e7.pngegg.com/pngimages/442/477/png-clipart-computer-icons-user-profile-avatar-profile-heroes-profile.png'
                            : post.avatar),
                      ),
                      if (post.isActive)
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserProfileScreen(
                                    userId: post.authorId,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              post.author,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                post.location,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Text(
                                post.time,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Text(post.time),
                ],
              ),
              const SizedBox(height: 15.0),
              Text(post.caption),
              post.postImages != [null, 2, null]
                  ? const SizedBox.shrink()
                  : const SizedBox(height: 6.0),
            ],
          ),
        ),
        post.postImages != [null, 2, null]
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CachedImage(post: post),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        // SizedBox(height: 20,),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //   child: PostBiddingSection(post: post),
        // ),
      ],
      // ),
    );
  }
}

class CachedImage extends StatefulWidget {
  final Post post;

  CachedImage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<CachedImage> createState() => _CachedImage();
}

class _CachedImage extends State<CachedImage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
          aspectRatio: 1.33,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              _currentPage = index;
            });
          },
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
        ),
        items: widget.post.postImages?.map((i) {
          return Builder(builder: (BuildContext context) {
            return ClipRRect(
              child: Image.network(i),
              // borderRadius: BorderRadius.circular(8)
            );
          });
        }).toList(),
      ),
      const SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          widget.post.postImages!.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: IndicatorDot(isActive: index == _currentPage),
          ),
        ),
      ),
    ]);
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Color(0xFFCDCDCD),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
