import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

class ListingDetails extends StatefulWidget {
  const ListingDetails({Key? key}) : super(key: key);

  @override
  _ListingDetailsState createState() => _ListingDetailsState();
}

class _ListingDetailsState extends State<ListingDetails> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];

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
              titleTextField(),
              SizedBox(
                height: 20,
              ),
              LocationTextField(),
              SizedBox(
                height: 20,
              ),
              ShippingTextField(),
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

  void selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      setState(() {
        // _imageList.clear();
        _imageList.addAll(selectedImages);
      });
    }
  }
}

class photoTextField extends StatelessWidget {
  const photoTextField({
    Key? key,
    required this.press,
  }) : super(key: key);

  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/add-photos.png',
                  color: Colors.black54,
                ),
                Text(
                  " Add Photos",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            onPressed: press,
          ),
        ],
      ),
    );
  }
}

Widget titleTextField() {
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
        labelText: "Title",
        helperText: "Title can't be empty",
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


class LocationTextField extends StatefulWidget {
  const LocationTextField({Key? key}) : super(key: key);

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  String dropdownValue = 'Not Available';
  String labelText = 'Local Pickup';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // value: labelText,
      hint: Text(labelText),
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
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
      ),
      // style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Not Available', 'Public Meetup', "Seller's Door Pickup", "Buyer's Door Dropoff"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ShippingTextField extends StatefulWidget {
  const ShippingTextField({Key? key}) : super(key: key);

  @override
  State<ShippingTextField> createState() => _ShippingTextFieldState();
}

class _ShippingTextFieldState extends State<ShippingTextField> {
  String dropdownValue = 'Not Available';
  String labelText = 'Shipping';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // value: labelText,
      hint: Text(labelText),
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
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
      ),
      // style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Not Available', 'Free Economy Shipping', "Buyer Pays for Shipping"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
