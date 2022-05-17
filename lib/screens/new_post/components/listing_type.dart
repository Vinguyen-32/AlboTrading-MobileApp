import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ListingType extends StatefulWidget {

  final Function changeTab;
  const ListingType({Key? key, required this.changeTab }) : super(key:key);

  @override
  _ListingTypeState createState() => _ListingTypeState();
}

class _ListingTypeState extends State<ListingType> {
  int selectedListType = 0;
  List<String> listingTypes = ["Trade", "Auction"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listingTypes.length,
        itemBuilder: (context, index) => buildType(index, context),
      ),
    );
  }

  Padding buildType(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.changeTab(index);
            selectedListType = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              listingTypes[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w600,
                color: index == selectedListType
                    ? textColor
                    : Colors.black.withOpacity(0.4),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 6),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedListType
                    ? kPrimaryColor
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}