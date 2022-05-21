import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/screens/trading_details/components/body.dart';

import '../../constants.dart';
import '../../models/DataProvider.dart';
import '../../models/Post.dart';

class TradingDetailsScreen extends StatefulWidget {
  final String postId;
  const TradingDetailsScreen({Key? key, required this.postId})
      : super(key: key);

  @override
  TradingDetailsScreenState createState() => TradingDetailsScreenState();
}

class TradingDetailsScreenState extends State<TradingDetailsScreen> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = DataProvider().getPost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Post post = snapshot.data ?? Post();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              leading: IconButton(
                icon: Image.asset(
                  'assets/icons/back_icon.png',
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              actions: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/search_icon.png',
                      color: Colors.white,
                    )),
                SizedBox(width: kDefaultPadding / 2)
              ],
            ),
            body: Body(post: post),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
