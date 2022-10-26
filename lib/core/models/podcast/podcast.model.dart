class PodcastModel {
  const PodcastModel({
    required this.author,
    required this.currentplaybackTime,
    required this.podcastName,
    required this.totalPlaybackTime,
    required this.image,
    required this.thumbnail,
  });

  final String podcastName;
  final String author;
  final String currentplaybackTime;
  final String totalPlaybackTime;
  final String image;
  final String thumbnail;
}
