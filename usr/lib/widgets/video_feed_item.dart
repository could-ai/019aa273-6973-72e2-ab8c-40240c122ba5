import 'package:flutter/material.dart';

class VideoFeedItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const VideoFeedItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Video Placeholder (Background)
        Container(
          color: data['color'],
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 80,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),

        // 2. Right Side Action Buttons
        Positioned(
          right: 10,
          bottom: 100,
          child: Column(
            children: [
              _buildProfileImage(),
              const SizedBox(height: 20),
              _buildActionButton(Icons.favorite, data['likes'], Colors.red),
              const SizedBox(height: 20),
              _buildActionButton(Icons.comment, data['comments'], Colors.white),
              const SizedBox(height: 20),
              _buildActionButton(Icons.share, data['shares'], Colors.white),
              const SizedBox(height: 20),
              _buildVinylDisc(),
            ],
          ),
        ),

        // 3. Bottom Info Section
        Positioned(
          left: 16,
          bottom: 20,
          right: 80, // Leave space for the right column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['username'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                data['description'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.music_note, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      data['song'],
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60), // Space for bottom nav
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
        color: Colors.grey.shade800,
      ),
      child: const Icon(Icons.person, color: Colors.white),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 35, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildVinylDisc() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade800, width: 8),
      ),
      child: const Center(
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.red,
          child: Icon(Icons.music_note, size: 10, color: Colors.white),
        ),
      ),
    );
  }
}
