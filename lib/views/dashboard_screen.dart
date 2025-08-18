import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/permission_controller.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.put(DashboardController());
  final permissionController = Get.put(PermissionController());

  @override
  void initState() {
    super.initState();
    // Ask camera permission on dashboard entry
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await permissionController.requestCameraPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('안녕하세요,', style: TextStyle(fontSize: 20, color: Colors.black)),
                    Obx(() => Text(
                      '${controller.userName.value}님',
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                    )),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    print("click camera");
                    // Request camera permission when camera icon is clicked
                    await permissionController.requestCameraPermission();
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3EFFF),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 128, 68, 218), size: 28),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => Get.toNamed('/campaign'),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _StatusCard(title: '신청', count: controller.appliedCount),
                            VerticalDivider(
                              width: 24,
                              thickness: 1,
                              color: Color(0xFFE0E0E0),
                            ),
                            _StatusCard(title: '진행중', count: controller.inProgressCount),
                            VerticalDivider(
                              width: 24,
                              thickness: 1,
                              color: Color(0xFFE0E0E0),
                            ),
                            _StatusCard(title: '완료', count: controller.completedCount),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                itemCount: menuItems.length,
                itemBuilder: (context, index) => _MenuTile(
                  title: menuItems[index]['title'],
                  iconAsset: menuItems[index]['icon'],
                  onTap: menuItems[index]['onTap'],
                ),
                separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFE0E0E0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> menuItems = [
  {
    'title': '내 정보',
    'icon': 'assets/images/user.png',
    'onTap': () => Get.toNamed('/myinfo'),
  },
  {
    'title': '캠페인 매칭',
    'icon': 'assets/images/note.png',
  },
  {
    'title': '공지사항',
    'icon': 'assets/images/message-question.png',
    'onTap': null,
  },
  {
    'title': '1:1 문의',
    'icon': 'assets/images/note.png',
    'onTap': null,
  },
  {
    'title': 'FAQ',
    'icon': 'assets/images/message-question.png',
    'onTap': null,
  },
  {
    'title': '약관 및 정책',
    'icon': 'assets/images/task-square.png',
    'onTap': null,
  },
  {
    'title': '로그아웃',
    'icon': 'assets/images/logout.png',
    'onTap': null,
  },
  {
    'title': '회원탈퇴',
    'icon': 'assets/images/break-away.png',
    'onTap': null,
  },
];

class _StatusCard extends StatelessWidget {
  final String title;
  final RxInt count;
  const _StatusCard({required this.title, required this.count, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              '${count.value}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B228A),
              ),
            )),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback? onTap;
  const _MenuTile({required this.title, required this.iconAsset, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(iconAsset, width: 24, height: 24),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
