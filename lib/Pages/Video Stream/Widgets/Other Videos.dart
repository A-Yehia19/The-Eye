import 'package:flutter/material.dart';
import 'package:the_eye/Pages/Video%20Stream/Data/Variables.dart';
import 'package:the_eye/Pages/Video%20Stream/Video%20Stream.dart';

class OtherVideos extends StatelessWidget {
  const OtherVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recommendedList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VideoStream(video: recommendedList[index]),));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 125,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  recommendedList[index].thumbnail,
                  width: 160,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    recommendedList[index].caption,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
