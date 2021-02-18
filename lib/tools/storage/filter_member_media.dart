
import 'package:eliud_core/model/member_medium_model.dart';

class FilterMemberMedia {
  final List<MemberMediumModel> memberMedia;

  FilterMemberMedia(this.memberMedia);

  List<MemberMediumModel> getPhotos() {
    if (memberMedia == null) return null;
    var photos = memberMedia.where((medium) => medium.mediumType == MediumType.Photo).toList();
    if (photos.length == 0) return null;
    return photos;
  }

  List<MemberMediumModel> getVideos() {
    if (memberMedia == null) return null;
    var videos = memberMedia.where((medium) => medium.mediumType == MediumType.Video).toList();
    if (videos.length == 0) return null;
    return videos;
  }

}
