import 'package:get/get.dart';
import 'package:plant_trading_app/controller/user_profile_controller.dart';
import 'package:plant_trading_app/data/api/api_client.dart';
import 'package:plant_trading_app/data/repository/user_profile_repo.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://localhost:3000/"));
  // repos
  Get.lazyPut(() => UserProfileRepo(apiClient: Get.find()));
  // controllers
  Get.lazyPut(() => UserProfileController(userProfileRepo: Get.find()));
}