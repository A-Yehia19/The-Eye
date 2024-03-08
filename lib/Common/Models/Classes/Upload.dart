class Upload{
  final String id;
  final String caption;
  final String thumbnail;
  final String videoURL;
  final String status;
  final int views;
  final int interactions;

  Upload({
    required this.id,
    required this.caption,
    required this.thumbnail,
    required this.videoURL,
    required this.status,
    required this.views,
    required this.interactions
  });
}