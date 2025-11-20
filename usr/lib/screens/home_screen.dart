import 'package:flutter/material.dart';
import '../widgets/video_feed_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for the feed
    final List<Map<String, dynamic>> videos = [
      {
        'username': '@ai_artist',
        'description': 'Generated this entire landscape using Express AI! 🎨 #aiart #express',
        'song': 'Original Sound - AI Artist',
        'likes': '45.2K',
        'comments': '1,203',
        'shares': '502',
        'color': Colors.deepPurple.shade900,
      },
      {
        'username': '@tech_daily',
        'description': 'Reviewing the new AI script writer feature. It is insane! 🤖',
        'song': 'Tech Talk - Daily Beats',
        'likes': '120K',
        'comments': '5,400',
        'shares': '12K',
        'color': Colors.blueGrey.shade900,
      },
      {
        'username': '@dance_bot',
        'description': 'Learning new moves 💃',
        'song': 'Dance Till Dead - Remix',
        'likes': '8,000',
        'comments': '300',
        'shares': '50',
        'color': Colors.teal.shade900,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Following',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'For You',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoFeedItem(data: videos[index]);
        },
      ),
    );
  }
}
