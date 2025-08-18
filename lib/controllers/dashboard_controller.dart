

import 'package:get/get.dart';
import 'campaign_controller.dart';

class DashboardController extends GetxController {
  final RxString userName = '홍길동'.obs;

  final CampaignController campaignController = Get.find<CampaignController>();
  late RxInt appliedCount;
  late RxInt inProgressCount;
  late RxInt completedCount;

  @override
  void onInit() {
    appliedCount = campaignController.appliedCampaigns.length.obs;
    inProgressCount = campaignController.inProgressCampaigns.length.obs;
    completedCount = campaignController.completedCampaigns.length.obs;

    ever(campaignController.appliedCampaigns, (_) => appliedCount.value = campaignController.appliedCampaigns.length);
    ever(campaignController.inProgressCampaigns, (_) => inProgressCount.value = campaignController.inProgressCampaigns.length);
    ever(campaignController.completedCampaigns, (_) => completedCount.value = campaignController.completedCampaigns.length);
    super.onInit();
  }
}
