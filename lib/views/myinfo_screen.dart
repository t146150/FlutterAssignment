
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/myinfo_controller.dart';

class MyInfoScreen extends StatelessWidget {
  final MyInfoController controller = Get.put(MyInfoController());

  MyInfoScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> infoMenuItems = [
    {
      'title': '기본 정보',
      'icon': 'assets/images/user.png',
      'onTap': () {},
    },
    {
      'title': '비밀번호 설정',
      'icon': 'assets/images/message-question.png',
      'onTap': () {},
    },
    {
      'title': '관련 카테고리',
      'icon': 'assets/images/note.png',
      'onTap': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('내 정보', style: TextStyle(color: Color(0xFF4B228A))),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: infoMenuItems.length,
        itemBuilder: (context, index) => _InfoMenuTile(
          title: infoMenuItems[index]['title'],
          iconAsset: infoMenuItems[index]['icon'],
          onTap: infoMenuItems[index]['onTap'],
        ),
        separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFE0E0E0)),
      ),
    );
  }
}

class _InfoMenuTile extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback? onTap;
  const _InfoMenuTile({required this.title, required this.iconAsset, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _InfoSection({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
