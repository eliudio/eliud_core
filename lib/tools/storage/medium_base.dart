import 'medium_data.dart';

abstract class MediumBase {}

class PhotoWithThumbnail extends MediumBase {
  final ImageData photoData;
  final ImageData thumbNailData;

  PhotoWithThumbnail({
    required this.photoData,
    required this.thumbNailData,
  });
}

class VideoWithThumbnail extends MediumBase {
  final VideoData videoData;
  final ImageData thumbNailData;

  VideoWithThumbnail({required this.videoData, required this.thumbNailData});
}
