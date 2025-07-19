import 'package:flutter/material.dart';

class UploadContentPage extends StatelessWidget {
  const UploadContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Upload Images, Videos or Text",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UploadAnimatedButton(
              icon: Icons.image,
              label: "Upload Image",
              color: Colors.teal,
              onPressed: () {
                // Implement image upload logic here
              },
            ),
            const SizedBox(height: 16),
            UploadAnimatedButton(
              icon: Icons.videocam,
              label: "Upload Video",
              color: Colors.orange,
              onPressed: () {
                // Implement video upload logic here
              },
            ),
            const SizedBox(height: 16),
            UploadAnimatedButton(
              icon: Icons.text_fields,
              label: "Upload Text Message",
              color: Colors.deepPurple,
              onPressed: () {
                // Implement text upload logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UploadAnimatedButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const UploadAnimatedButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  State<UploadAnimatedButton> createState() => _UploadAnimatedButtonState();
}

class _UploadAnimatedButtonState extends State<UploadAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  void _onTapDown(_) => _controller.forward();
  void _onTapUp(_) => _controller.reverse();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _controller.reverse,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
