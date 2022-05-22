import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_trading_app/constants.dart';
import 'package:plant_trading_app/models/DataProvider.dart';
import 'package:plant_trading_app/models/UserProfile.dart';
import 'package:plant_trading_app/screens/login/login_screen.dart';
import 'package:plant_trading_app/screens/user_profile/user_profile_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../../globals.dart' as globals;

class UserProfileInfo extends StatefulWidget {
  final UserProfile userProfile;

  const UserProfileInfo({
    Key? key,
    required this.userProfile
  }) : super(key: key);

  @override
  UserProfileInfoState createState() => UserProfileInfoState();
}

class UserProfileInfoState extends State<UserProfileInfo> {

  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    UserProfile userProfile = widget.userProfile;

    void takePhoto(ImageSource source) async {
      final pickedFile = await _picker.getImage(
          source: source
      );
      setState(() {
        _imageFile = pickedFile;
      });

      if (_imageFile != null) {
        var user = await DataProvider().updateProfilePicture(_imageFile);
        globals.avatar = user.profileImage;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserProfileScreen()),
      );
    }

    Widget bottomSheet() {
      return Container(
        height: 220,
        child: Column(
          children: <Widget>[
            const Divider(
              thickness: 5,
              indent: 170,
              endIndent: 170,
              height: 20,
            ),
            ListTile(
              title: Text(
                "Choose Profile Image",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.camera_rounded,
                color: Colors.black87,
              ),
              title: Text(
                "Camera",
              ),
              onTap: () {
                takePhoto(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_camera_back,
                color: Colors.black87,
              ),
              title: Text(
                "Gallery",
              ),
              onTap: () {
                takePhoto(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: [
                Stack(
                  children: <Widget>[
                    ClipOval(
                      child: userProfile.profileImage == 'null'
                        ? Image.asset(
                          // userProfile.profileImage,
                          'assets/images/img.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          )
                        : Image.network(
                          userProfile.profileImage,
                          // 'assets/images/img.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: InkWell(
                        child: globals.id == userProfile.id ? Icon(
                          Icons.camera_alt,
                          size: 25,
                          color: Colors.black87,
                        ): Row(),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheet(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(
                        userProfile.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      SmoothStarRating(
                        allowHalfRating: true,
                        borderColor: kPrimaryColor,
                        rating: userProfile.stars.toDouble(),
                        starCount: userProfile.stars,
                        halfFilledIconData: Icons.star_half,
                        size: 18.0,
                        spacing: 0.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(
                        userProfile.trade.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Trades',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(
                        userProfile.bid.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Bids',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left:20.0),
                Expanded(
                  // flex: 2,
                  child: Column(
                    children: [
                      Text(
                        userProfile.followers.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: Column(
                    children: [
                      Text(
                        userProfile.following.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  // flex: 3,
                  child: SizedBox(
                    width: 70,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (userProfile.id == globals.id) {
                          globals.id = '';
                          globals.username = '';
                          globals.avatar = '';
                          globals.isLoggedIn = false;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        userProfile.id == globals.id ? "Logout" : 'Follow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
