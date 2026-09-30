import 'package:flutter/material.dart';
import 'courses_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildLearnTodayCard(),
                    const SizedBox(height: 20),
                    _buildWhatToLearnCard(context),
                    const SizedBox(height: 24),
                    const Text(
                      'Learning Plan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPlanItem('Packaging Design', 40, 48),
                    const SizedBox(height: 14),
                    _buildPlanItem('Product Design', 6, 24),
                    const SizedBox(height: 20),
                    _buildMeetupCard(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Header albastru cu salut ----
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      decoration: const BoxDecoration(
        color: Color(0xFF4E5AE8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Kristin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Let's start learning",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.orangeAccent,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // ---- Card "Learned today" cu progress bar ----
  Widget _buildLearnTodayCard() {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Learned today',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                Text(
                  'My courses',
                  style: TextStyle(
                    color: const Color(0xFF4E5AE8),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '46min ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '/ 60min',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 46 / 60,
                minHeight: 6,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Card "What do you want to learn today" ----
  Widget _buildWhatToLearnCard(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 170,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFCFE3FF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What do you want\nto learn today?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CoursesScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Get Started'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              color: const Color(0xFFE4ECFB),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Icon(Icons.check_circle,
                  size: 40, color: Color(0xFF4E5AE8)),
            ),
          ),
        ),
      ],
    );
  }

  // ---- Item din "Learning Plan" cu progres circular ----
  Widget _buildPlanItem(String title, int current, int total) {
    final double percent = current / total;
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: percent,
                strokeWidth: 4,
                backgroundColor: Colors.grey.shade200,
                valueColor:
                const AlwaysStoppedAnimation(Color(0xFF4E5AE8)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          '$current',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          '/$total',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
        ),
      ],
    );
  }

  // ---- Card "Meetup" mov ----
  Widget _buildMeetupCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE4FB),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Meetup',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF6A3FB5),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Off-line exchange of learning experience',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orangeAccent,
            child: Icon(Icons.person, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }
}