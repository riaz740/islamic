import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityModel {
  final String userName;
  final String userImage;
  final String timeAgo;
  final String content;
  final String? postImage;
  final int likes;
  final int comments;
  bool isLiked;

  CommunityModel({
    required this.userName,
    required this.userImage,
    required this.timeAgo,
    required this.content,
    this.postImage,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });
}

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CommunityModel> posts = [
      CommunityModel(
        userName: 'Abdullah Ahmed',
        userImage: 'assets/user1.png', // Placeholder
        timeAgo: '2h ago',
        content:
            'Alhamdulillah, just finished reading Surah Al-Kahf. Don\'t forget to read it today, it\'s Friday!',
        likes: 124,
        comments: 45,
        isLiked: true,
      ),
      CommunityModel(
        userName: 'Fatima Zahra',
        userImage: 'assets/user2.png', // Placeholder
        timeAgo: '4h ago',
        content:
            'Does anyone know looking for a good tafsir book for beginners? Recommendations needed.',
        likes: 56,
        comments: 23,
      ),
      CommunityModel(
        userName: 'Islamic Center',
        userImage: 'assets/logo.png', // Placeholder
        timeAgo: '1d ago',
        content:
            'Join us for the community Iftar this Saturday at the central mosque. All are welcome!',
        postImage: 'assets/iftar.png', // Placeholder
        likes: 230,
        comments: 12,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Community',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_note, size: 28),
            onPressed: () {
              Get.snackbar(
                'New Post',
                'Create post feature coming soon!',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: post.userImage.contains('assets')
                            ? null
                            : NetworkImage(post.userImage),
                        child: post.userImage.contains('assets')
                            ? const Icon(Icons.person, color: Colors.grey)
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            post.timeAgo,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.more_horiz, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    post.content,
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),
                  if (post.postImage != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey,
                      ), // Placeholder for image
                    ),
                  ],
                  const SizedBox(height: 16),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(
                        icon: post.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        label: '${post.likes}',
                        color: post.isLiked ? Colors.red : Colors.grey,
                        onTap: () {},
                      ),
                      _buildActionButton(
                        icon: Icons.chat_bubble_outline,
                        label: '${post.comments}',
                        color: Colors.grey,
                        onTap: () {},
                      ),
                      _buildActionButton(
                        icon: Icons.share_outlined,
                        label: 'Share',
                        color: Colors.grey,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            'New Post',
            'Create post feature coming soon!',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        backgroundColor: const Color(0xFF00BCD4),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
