import 'dart:async';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';

class MediumInfo {
  final int? width;
  final int? height;
  final String? url;

  MediumInfo(this.width, this.height, this.url);
}

class ChainOfMediumModels {
  static void _addMemberMediumUrl(
      List<String?> urls, MemberMediumModel currentPolicy) {
    if (currentPolicy.mediumType == MediumType.photo) {
      urls.add(currentPolicy.url);
    }
  }

  static void _addPlatformMediumUrl(
      List<String?> urls, PlatformMediumModel currentPolicy) {
    if (currentPolicy.mediumType == PlatformMediumType.photo) {
      urls.add(currentPolicy.url);
    }
  }

  static void _addPublicMediumUrl(
      List<String?> urls, PublicMediumModel currentPolicy) {
    if (currentPolicy.mediumType == PublicMediumType.photo) {
      urls.add(currentPolicy.url);
    }
  }

  static void _addMemberMediumInfo(
      List<MediumInfo> infos, MemberMediumModel currentPolicy) {
    if (currentPolicy.mediumType == MediumType.photo) {
      infos.add(MediumInfo(currentPolicy.mediumWidth,
          currentPolicy.mediumHeight, currentPolicy.url));
    }
  }

  static void _addPlatformMediumInfo(
      List<MediumInfo> infos, PlatformMediumModel currentPolicy) {
    if (currentPolicy.mediumType == PlatformMediumType.photo) {
      infos.add(MediumInfo(currentPolicy.mediumWidth,
          currentPolicy.mediumHeight, currentPolicy.url));
    }
  }

  static void _addPublicMediumInfo(
      List<MediumInfo> infos, PublicMediumModel currentPolicy) {
    if (currentPolicy.mediumType == PublicMediumType.photo) {
      infos.add(MediumInfo(currentPolicy.mediumWidth,
          currentPolicy.mediumHeight, currentPolicy.url));
    }
  }

  static Future<List<String>> getMemberMediumChainOfUrls(
      String appId, MemberMediumModel memberMediumModel) async {
    var urls = <String>[];
    var currentPolicy = memberMediumModel;
    _addMemberMediumUrl(urls, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addMemberMediumUrl(urls, currentPolicy);
      }
    }
    return urls;
  }

  static Future<List<String>> getPlatformMediumChainOfUrls(
      String appId, PlatformMediumModel platformMediumModel) async {
    var urls = <String>[];
    var currentPolicy = platformMediumModel;
    _addPlatformMediumUrl(urls, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await platformMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addPlatformMediumUrl(urls, currentPolicy);
      }
    }
    return urls;
  }

  static Future<List<String>> getPublicMediumChainOfUrls(
      String appId, PublicMediumModel publicMediumModel) async {
    var urls = <String>[];
    var currentPolicy = publicMediumModel;
    _addPublicMediumUrl(urls, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await publicMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addPublicMediumUrl(urls, currentPolicy);
      }
    }
    return urls;
  }

  static Future<List<MediumInfo>> getMemberMediumModelChainOfMediumInfo(
      String? appId, MemberMediumModel memberMediumModel) async {
    var infos = <MediumInfo>[];
    var currentPolicy = memberMediumModel;
    _addMemberMediumInfo(infos, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addMemberMediumInfo(infos, currentPolicy);
      }
    }
    return infos;
  }

  static Future<List<MediumInfo>> getPlatformMediumModelChainOfMediumInfo(
      String? appId, PlatformMediumModel platformMediumModel) async {
    var infos = <MediumInfo>[];
    var currentPolicy = platformMediumModel;
    _addPlatformMediumInfo(infos, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await platformMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addPlatformMediumInfo(infos, currentPolicy);
      }
    }
    return infos;
  }

  static Future<List<MediumInfo>> getPublicMediumModelChainOfMediumInfo(
      String? appId, PublicMediumModel publicMediumModel) async {
    var infos = <MediumInfo>[];
    var currentPolicy = publicMediumModel;
    _addPublicMediumInfo(infos, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await publicMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addPublicMediumInfo(infos, currentPolicy);
      }
    }
    return infos;
  }

  static Future<List<MemberMediumModel>> getMemberMediumModelChainOfMedium(
      String? appId, MemberMediumModel memberMediumModel) async {
    var infos = <MemberMediumModel>[];
    var currentPolicy = memberMediumModel;
    infos.add(currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        infos.add(currentPolicy);
      }
    }
    return infos;
  }

  static Future<List<PlatformMediumModel>> getPlatformMediumModelChainOfMedium(
      String? appId, PlatformMediumModel platformMediumModel) async {
    var infos = <PlatformMediumModel>[];
    var currentPolicy = platformMediumModel;
    infos.add(currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await platformMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        infos.add(currentPolicy);
      }
    }
    return infos;
  }

  static Future<List<PublicMediumModel>> getPublicMediumModelChainOfMedium(
      String? appId, PublicMediumModel publicMediumModel) async {
    var infos = <PublicMediumModel>[];
    var currentPolicy = publicMediumModel;
    infos.add(currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await publicMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        infos.add(currentPolicy);
      }
    }
    return infos;
  }
}
