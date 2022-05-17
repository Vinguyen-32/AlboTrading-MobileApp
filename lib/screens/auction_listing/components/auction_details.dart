import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_trading_app/constants.dart';

class AuctionDetails extends StatefulWidget {
  const AuctionDetails({Key? key}) : super(key: key);

  @override
  _AuctionDetailsState createState() => _AuctionDetailsState();
}

class _AuctionDetailsState extends State<AuctionDetails> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              priceTextField(),
              SizedBox(
                height: 20,
              ),
              locationTextField(),
              SizedBox(
                height: 20,
              ),
              descriptionTextField(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

// void fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print(response.body);
//     // return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
}

Widget priceTextField() {
  return Flexible(
    child: TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
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
        labelText: "Auction Start Price",
        helperText: "This field can't be empty",
      ),
    ),
  );
}

Widget locationTextField() {
  return Flexible(
    child: TextFormField(
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
        labelText: "Meetup Location",
        helperText: "Location can be empty",
      ),
    ),
  );
}

Widget descriptionTextField() {
  return TextFormField(
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
      labelText: "Description",
    ),
    maxLines: null,
    maxLength: 200,
    // maxLines: null,
    // expands: true,
  );
}

