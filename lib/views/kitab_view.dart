import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookModel {
  final String title;
  final String author;
  final String category;
  final Color coverColor;
  final double rating;

  BookModel({
    required this.title,
    required this.author,
    required this.category,
    required this.coverColor,
    required this.rating,
  });
}

class KitabView extends StatelessWidget {
  const KitabView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookModel> books = [
      BookModel(
        title: 'Sahih Al-Bukhari',
        author: 'Imam Bukhari',
        category: 'Hadith',
        coverColor: const Color(0xFF1E88E5),
        rating: 5.0,
      ),
      BookModel(
        title: 'Riyad as-Salihin',
        author: 'Imam An-Nawawi',
        category: 'Ethics',
        coverColor: const Color(0xFF43A047),
        rating: 4.9,
      ),
      BookModel(
        title: 'Stories of the Prophets',
        author: 'Ibn Kathir',
        category: 'History',
        coverColor: const Color(0xFFFB8C00),
        rating: 4.8,
      ),
      BookModel(
        title: 'Fortress of the Muslim',
        author: 'Sa\'id bin Wahf',
        category: 'Dua',
        coverColor: const Color(0xFF8E24AA),
        rating: 4.9,
      ),
      BookModel(
        title: 'Seerah of Prophet (PBUH)',
        author: 'Yasir Qadhi',
        category: 'Biography',
        coverColor: const Color(0xFF00ACC1),
        rating: 5.0,
      ),
      BookModel(
        title: '40 Hadith Qudsi',
        author: 'Multiple',
        category: 'Hadith',
        coverColor: const Color(0xFF5E35B1),
        rating: 4.7,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Islamic Library',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('All', true),
                  _buildCategoryChip('Hadith', false),
                  _buildCategoryChip('Fiqh', false),
                  _buildCategoryChip('History', false),
                  _buildCategoryChip('Biography', false),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 80,
                              height: 120,
                              decoration: BoxDecoration(
                                color: book.coverColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        book.coverColor.withValues(alpha: 0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              book.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              book.author,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'This is a placeholder description for the book. It will contain details about the contents, the author, and other relevant information.',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  Get.snackbar(
                                    'Read Book',
                                    'Reading feature coming soon!',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF5722),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Read Now'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: book.coverColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Center(
                                child: Icon(
                                  Icons.book,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${book.rating}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        book.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        book.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor:
            isSelected ? const Color(0xFFFF5722) : Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      ),
    );
  }
}
