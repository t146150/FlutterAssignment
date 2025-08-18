
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/campaign_controller.dart';
import '../widgets/campaign_card.dart';

class CampaignScreen extends StatelessWidget {
  final CampaignController controller = Get.put(CampaignController());

  CampaignScreen({Key? key}) : super(key: key);

  final List<String> tabTitles = ['신청', '진행중', '완료'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('캠페인 매칭', style: TextStyle(color: Color(0xFF4B228A))),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Color(0xFF4B228A),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF4B228A),
            tabs: tabTitles.map((t) => Tab(text: t)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            _CampaignList(type: 'applied', controller: controller),
            _CampaignList(type: 'inProgress', controller: controller),
            _CampaignList(type: 'completed', controller: controller),
          ],
        ),
      ),
    );
  }
}

class _CampaignList extends StatelessWidget {
  final String type;
  final CampaignController controller;
  const _CampaignList({required this.type, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final campaigns = controller.getCampaigns(type);
      if (campaigns.isEmpty) {
        return const Center(child: Text('캠페인이 없습니다.'));
      }
      return ListView.builder(
        itemCount: campaigns.length,
        itemBuilder: (context, index) {
          final campaign = campaigns[index];
          return CampaignCard(
            campaign: campaign,
            onApply: () => controller.applyToCampaign(campaign.id),
          );
        },
      );
    });
  }
}
