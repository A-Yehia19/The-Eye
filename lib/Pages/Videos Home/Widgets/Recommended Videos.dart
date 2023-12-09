import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Videos%20Home/Data/Variables.dart';

class RecommendedVideos extends StatelessWidget {
  const RecommendedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videosList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context,
              '/videoStream',
              arguments: videosList[index],
            ),
            child: Container(
              height: 230,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(videosList[index].thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(videosList[index].caption,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.78,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      )
    );
  }
}
