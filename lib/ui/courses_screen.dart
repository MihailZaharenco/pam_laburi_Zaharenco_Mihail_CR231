import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategoryCards(),
              const SizedBox(height: 24),
              const Text(
                'Choice your course',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              _buildFilterTabs(),
              const SizedBox(height: 16),
              _buildCourseCard(
                title: 'Product Design v1.0',
                author: 'Robertson Connie',
                price: '\$190',
                hours: '16 hours',
              ),
              const SizedBox(height: 12),
              _buildCourseCard(
                title: 'Java Development',
                author: 'Nguyen Shane',
                price: '\$190',
                hours: '16 hours',
              ),
              const SizedBox(height: 12),
              _buildCourseCard(
                title: 'Visual Design',
                author: 'Bert Pullman',
                price: '\$250',
                hours: '14 hours',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Course',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFF4E5AE8),
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Find Course',
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildCategoryCards() {
    return Row(
      children: [
        Expanded(
          child: _categoryCard(
            'Language',
            const Color(0xFFCFE3FF),
            Icons.language,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: _categoryCard(
            'Painting',
            const Color(0xFFF7DDE8),
            Icons.brush,
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, Color color, IconData icon) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF4E5AE8)),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF4E5AE8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Row(
      children: [
        _filterChip('All', selected: true),
        const SizedBox(width: 10),
        _filterChip('Popular', selected: false),
        const SizedBox(width: 10),
        _filterChip('New', selected: false),
      ],
    );
  }

  Widget _filterChip(String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF4E5AE8) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String author,
    required String price,
    required String hours,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.person, size: 14, color: Colors.grey.shade500),
                    const SizedBox(width: 4),
                    Text(
                      author,
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF4E5AE8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        hours,
                        style: TextStyle(
                          color: Colors.orange.shade700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}