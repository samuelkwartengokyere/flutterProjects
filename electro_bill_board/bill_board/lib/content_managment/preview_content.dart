import 'package:flutter/material.dart';

class PreviewContentPage extends StatelessWidget {
  const PreviewContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        title: const Text("Preview Content",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3F51B5),
        iconTheme: const IconThemeData(color: Color(0xFFFDF6F0)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AnimatedPreviewCard(
            mediaType: MediaType.image,
            mediaUrl: "https://via.placeholder.com/300x150.png?text=Sample+Image",
            description: "Sample Announcement Text",
          ),
          SizedBox(height: 16),
          AnimatedPreviewCard(
            mediaType: MediaType.video,
            mediaUrl: "", // Not required for dummy video box
            description: "Sample Video Preview",
          ),
        ],
      ),
    );
  }
}

enum MediaType { image, video }

class AnimatedPreviewCard extends StatelessWidget {
  final MediaType mediaType;
  final String mediaUrl;
  final String description;

  const AnimatedPreviewCard({
    super.key,
    required this.mediaType,
    required this.mediaUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          if (mediaType == MediaType.image)
            FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png', // Add a local placeholder asset if needed
              image: mediaUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          else
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.black12,
              child: const Center(
                child: Icon(Icons.videocam, size: 50, color: Colors.black45),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    // Logic to publish goes here
                  },
                  icon: const Icon(Icons.publish),
                  label: const Text("Publish Now"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
