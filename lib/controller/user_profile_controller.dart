import 'package:get/get.dart';
import 'package:plant_trading_app/data/repository/user_profile_repo.dart';

class UserProfileController extends GetxController {
  final UserProfileRepo userProfileRepo;
  UserProfileController({required this.userProfileRepo});

  List<dynamic> _userProfileData = [];
  List<dynamic> get userProfileData => _userProfileData;

  Future<void> getUserProfileData() async {
    Response response = await userProfileRepo.getUserProfileData();
    if(response.statusCode==200) {
      _userProfileData = [];
      // _userProfileData.addAll();
      update(); //setState()
    } else {

    }
  }
}