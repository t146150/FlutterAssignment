

import 'package:get/get.dart';

class Campaign {
  final int id;
  final String imageUrl;
  final String title;
  final String description;
  final List<String> tags;

  Campaign({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tags,
  });
}

class CampaignController extends GetxController {
  final RxList<Campaign> appliedCampaigns = <Campaign>[].obs;
  final RxList<Campaign> inProgressCampaigns = <Campaign>[].obs;
  final RxList<Campaign> completedCampaigns = <Campaign>[].obs;

  CampaignController() {
    appliedCampaigns.addAll([
      Campaign(
        id: 1,
        imageUrl: 'assets/images/pic1.png',
        title: '회사명 나오는 자리',
        description: '소개말 나오는 자리입니다. 한줄만 나옵니다...',
        tags: ['F&B', '패션', '유아/키즈', '리빙/엔터테인먼트'],
      ),
      Campaign(
        id: 2,
        imageUrl: 'assets/images/pic2.png',
        title: '회사명 나오는 자리',
        description: '소개말 나오는 자리입니다. 한줄만 나옵니다...',
        tags: ['F&B', '패션', '유아/키즈', '리빙/엔터테인먼트'],
      ),
      Campaign(
        id: 3,
        imageUrl: 'assets/images/pic3.png',
        title: '회사명 나오는 자리',
        description: '소개말 나오는 자리입니다. 한줄만 나옵니다...',
        tags: ['F&B', '패션', '유아/키즈', '리빙/엔터테인먼트'],
      ),
      Campaign(
        id: 4,
        imageUrl: 'assets/images/pic4.png',
        title: '회사명 나오는 자리',
        description: '소개말 나오는 자리입니다. 한줄만 나옵니다...',
        tags: ['F&B', '패션', '유아/키즈', '리빙/엔터테인먼트'],
      ),
      Campaign(
        id: 5,
        imageUrl: 'assets/images/pic5.png',
        title: '회사명 나오는 자리',
        description: '소개말 나오는 자리입니다. 한줄만 나옵니다...',
        tags: ['F&B', '패션', '유아/키즈', '리빙/엔터테인먼트'],
      ),
    ]);
    inProgressCampaigns.addAll([
      Campaign(
        id: 6,
        imageUrl: 'assets/images/pic1.png',
        title: '진행중 캠페인',
        description: '진행중인 캠페인입니다. 한줄만 나옵니다...',
        tags: ['F&B', '패션', '유아/키즈'],
      ),
      Campaign(
        id: 7,
        imageUrl: 'assets/images/pic2.png',
        title: '진행중 캠페인',
        description: '진행중인 캠페인입니다. 한줄만 나옵니다...',
        tags: ['리빙/엔터테인먼트'],
      ),
    ]);
    completedCampaigns.addAll([
      Campaign(
        id: 8,
        imageUrl: 'assets/images/pic3.png',
        title: '완료된 캠페인',
        description: '완료된 캠페인입니다. 한줄만 나옵니다...',
        tags: ['F&B', '패션'],
      ),
      Campaign(
        id: 9,
        imageUrl: 'assets/images/pic4.png',
        title: '완료된 캠페인',
        description: '완료된 캠페인입니다. 한줄만 나옵니다...',
        tags: ['유아/키즈', '리빙/엔터테인먼트'],
      ),
    ]);
  }

  List<Campaign> getCampaigns(String type) {
    switch (type) {
      case 'applied':
        return appliedCampaigns;
      case 'inProgress':
        return inProgressCampaigns;
      case 'completed':
        return completedCampaigns;
      default:
        return [];
    }
  }

  void applyToCampaign(int id) {
    // Add your business logic here
    print('Applied to campaign $id');
  }
}
