import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/Post.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../bidding_details_screen.dart';

class PostBiddingSection extends StatefulWidget {
  final Post post;

  const PostBiddingSection({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  PostBiddingSectionState createState() => PostBiddingSectionState();
}

class PostBiddingSectionState extends State<PostBiddingSection> {
  final _controller = TextEditingController();
  double currentPrice = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    Post post = widget.post;
    DateTime end = DateTime.parse(post.endAt);
    Duration duration = end.difference(DateTime.now());
    int daysTillEnd = duration.inDays;
    int hoursTillEnd = duration.inHours % 24;
    int minsTillEnd = duration.inMinutes % 60;

    setState(() {
      if (isNumeric(widget.post.price))
        currentPrice = double.parse(widget.post.price);
    });

    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              child: (Image.asset(
                'assets/icons/calendar.png',
                width: 20,
                height: 20,
              )),
            ),
            Text(
              'Bidding ends in ' +
                  (daysTillEnd == 0
                      ? ''
                      : (daysTillEnd.toString() + ' days ')) +
                  hoursTillEnd.toString() +
                  ' hours ' +
                  (daysTillEnd == 0
                      ? minsTillEnd.toString() + ' minutes'
                      : '') +
                  ' | ' +
                  DateFormat.E().add_jms().format(end),
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Container(
              // padding: const EdgeInsets.all(4.0),
              child: (Image.asset(
                'assets/icons/dollar-symbol.png',
                // width: 30,
                // height: 30,
                color: kPrimaryColor,
              )),
            ),
            Text(
              currentPrice.toString() ?? "0",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 50,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
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
        SizedBox(
          height: 10,
        ),
        Row(
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
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 5),
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Bid Amount',
                  isDense: true,
                  contentPadding: EdgeInsets.all(9),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 39,
                child: ElevatedButton(
                  onPressed: ()async {
                      double amount = double.parse(_controller.text);
                      await DataProvider().placeBid(widget.post.id, "1", amount);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BiddingDetailsScreen(postId: widget.post.id)),
                      );
                  },
                  child: Text(
                    'Place Bid',
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
                    backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
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

}
