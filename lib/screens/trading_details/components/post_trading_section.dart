import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_trading_app/models/Post.dart';
import 'package:plant_trading_app/screens/trading_details/trading_details_screen.dart';

import '../../../constants.dart';
import '../../../models/DataProvider.dart';
import '../../auction_listing/components/auction_details.dart';

class PostTradingSection extends StatefulWidget {
  final Post post;

  const PostTradingSection({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  PostTradingSectionState createState() => PostTradingSectionState();
}

class PostTradingSectionState extends State<PostTradingSection> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();

  List<XFile> _imageList = [];
  bool addedPics = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            children: [
              Container(
                // padding: const EdgeInsets.all(4.0),
                child: (Image.asset(
                  'assets/icons/location.png',
                  width: 20,
                  height: 20,
                )),
              ),
              Text(
                "  Local Pickup - " + (widget.post.locationOption ?? ''),
                style: TextStyle(
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            children: [
              Container(
                // padding: const EdgeInsets.all(4.0),
                child: (Image.asset(
                  'assets/icons/delivery-truck.png',
                  width: 20,
                  height: 20,
                )),
              ),
              Text(
                "  Shipping - " + (widget.post.shippingOption ?? ''),
                style: TextStyle(
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageList!.length == 0
                  ? Column(children: [
                      photoTextField(press: selectImages),
                      SizedBox(
                        height: 20,
                      ),
                    ])
                  : Column(
                      children: [
                        Container(
                          height: 101,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ..._imageList.map((i) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Container(
                                      height: 100,
                                      child: Row(
                                        children: [
                                          Image.file(File(i.path)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                                }).toList(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Column(children: [
                                    photoTextField(press: selectImages),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  labelText: "Title",
                ),
                maxLines: null,
                maxLength: 200,
                // maxLines: null,
                // expands: true,
              ),
              SizedBox(
                width: 200,
                height: 39,
                child: ElevatedButton(
                  onPressed: addedPics ? handleUpload : () => {},
                  child: Text(
                    'Upload Your Plant',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.red, // background
                  //   onPrimary: Colors.white, // foreground
                  // ),
                  style: ButtonStyle(
                    backgroundColor: addedPics
                        ? MaterialStateProperty.all<Color>(kPrimaryColor)
                        : MaterialStateProperty.all<Color>(disableColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 39,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    'Add to Wishlist',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.red, // background
                  //   onPrimary: Colors.white, // foreground
                  // ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      setState(() {
        // _imageList.clear();
        _imageList.addAll(selectedImages);
        addedPics = true;
      });
    }
  }

  void handleUpload() async {

    await Future.wait([
      DataProvider().offerTrade(
        widget.post.id,
        _controller.text,
        _imageList,
      )
    ]);


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TradingDetailsScreen(postId: widget.post.id)),
    );
  }
}
