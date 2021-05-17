import 'dart:async';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';

class MediumInfo {
  final int? width;
  final int? height;
  final String? url;

  MediumInfo(this.width, this.height, this.url);
}

class ChainOfMediumModels {
  static void _addUrl(List<String?> urls, MemberMediumModel currentPolicy) {
    if (currentPolicy.mediumType == MediumType.Photo) {
      urls.add(currentPolicy.url);
    }
  }

  static void _addInfo(List<MediumInfo> infos, MemberMediumModel currentPolicy) {
    if (currentPolicy.mediumType == MediumType.Photo) {
      infos.add(MediumInfo(currentPolicy.mediumWidth,
          currentPolicy.mediumHeight, currentPolicy.url));
    }
  }

  static Future<List<String?>> getChainOfUrls(
      String appId, MemberMediumModel memberMediumModel) async {
    var urls = <String?>[];
    var currentPolicy = memberMediumModel;
    _addUrl(urls, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addUrl(urls, currentPolicy);
      }
    }
    return urls;
  }

  static Future<List<MediumInfo>> getChainOfMediumInfo(
      String? appId, MemberMediumModel memberMediumModel) async {
    var infos = <MediumInfo>[];
    var currentPolicy = memberMediumModel;
    _addInfo(infos, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addInfo(infos, currentPolicy);
      }
    }
    return infos;
  }
}
