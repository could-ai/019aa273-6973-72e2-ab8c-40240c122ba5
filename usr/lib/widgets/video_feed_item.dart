import 'package:flutter/material.dart';

class VideoFeedItem extends StatefulWidget {
  final Map<String, dynamic> data;

  const VideoFeedItem({super.key, required this.data});

  @override
  State<VideoFeedItem> createState() => _VideoFeedItemState();
}

class _VideoFeedItemState extends State<VideoFeedItem> with TickerProviderStateMixin {
  late AnimationController _likeController;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _likeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _likeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Video Placeholder (Background) with gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.data['color'],
                widget.data['color'].withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_circle_outline,
                size: 80,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ),

        // 2. Right Side Action Buttons with animations
        Positioned(
          right: 10,
          bottom: 100,
          child: Column(
            children: [
              _buildProfileImage(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                  if (_isLiked) {
                    _likeController.forward();
                  } else {
                    _likeController.reverse();
                  }
                },
                child: AnimatedBuilder(
                  animation: _likeController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 + (_likeController.value * 0.2),
                      child: _buildActionButton(
                        Icons.favorite,
                        widget.data['likes'],
                        _isLiked ? Colors.red : Colors.white,
                        glow: _isLiked,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              _buildActionButton(Icons.comment, widget.data['comments'], Colors.white),
              const SizedBox(height: 20),
              _buildActionButton(Icons.share, widget.data['shares'], Colors.white),
              const SizedBox(height: 20),
              _buildVinylDisc(),
            ],
          ),
        ),

        // 3. Bottom Info Section with improved styling
        Positioned(
          left: 16,
          bottom: 20,
          right: 80, // Leave space for the right column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.data['username'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.data['description'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.music_note, color: Colors.white, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.data['song'],
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
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
        border: Border.all(color: const Color(0xFF00F7FF), width: 2),
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.purple],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(Icons.person, color: Colors.white),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color, {bool glow = false}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
            boxShadow: glow
                ? [
                    BoxShadow(
                      color: color.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]
                : null,
          ),
          child: Icon(icon, size: 30, color: color),
        ),
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
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
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