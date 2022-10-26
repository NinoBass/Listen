import 'package:flutter/material.dart';
import 'package:listen/core/models/podcast/podcast.model.dart';
import 'package:listen/presentation/resources/colors.res.dart';
import 'package:listen/presentation/widgets/spacing.dart';

class PodcastTileUi extends StatelessWidget {
  const PodcastTileUi({
    Key? key,
    required this.podcast,
  }) : super(key: key);

  final PodcastModel podcast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: semiDark,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: dark,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const HorizontalSpace(size: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  podcast.podcastName,
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const VerticalSpace(size: 4),
                Text(
                  podcast.author,
                  style: const TextStyle(
                    color: grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const VerticalSpace(size: 14),
                RichText(
                  text: TextSpan(
                    text: "${podcast.currentplaybackTime}/",
                    children: [
                      TextSpan(
                        text: podcast.totalPlaybackTime,
                        style: const TextStyle(
                          color: accentColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    style: const TextStyle(
                      fontSize: 10,
                      color: grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5.0),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: accentColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
