/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppCache implements AppRepository {

  final AppRepository reference;
  final Map<String, AppModel> fullCache = Map();

  AppCache(this.reference);

  Future<AppModel> add(AppModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(AppModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<AppModel> get(String id, {Function(Exception) onError}) {
    AppModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id, onError: onError).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<AppModel> update(AppModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<AppModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return reference.values(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Stream<List<AppModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return reference.valuesWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Future<List<AppModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await reference.valuesList(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }
  
  @override
  Future<List<AppModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await reference.valuesListWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  void flush() {
    fullCache.clear();
  }
  
  String timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  } 

  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  Future<AppModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    return reference.changeValue(documentId, fieldName, changeByThisValue).then((newValue) {
      fullCache[documentId] = newValue;
      return newValue;
    });
  }

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<AppModel>> listen(trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<AppModel>> listenWithDetails(trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    return reference.listenWithDetails(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<AppModel> listenTo(String documentId, changed) {
    reference.listenTo(documentId, changed);
  }

  static Future<AppModel> refreshRelations(AppModel model) async {

    MemberMediumModel logoHolder;
    if (model.logo != null) {
      try {
        await memberMediumRepository(appId: model.logo.appId).get(model.logo.documentID).then((val) {
          logoHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel formBackgroundHolder;
    if (model.formBackground != null) {
      try {
        await backgroundRepository(appId: model.formBackground.appId).get(model.formBackground.documentID).then((val) {
          formBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel formAppBarBackgroundHolder;
    if (model.formAppBarBackground != null) {
      try {
        await backgroundRepository(appId: model.formAppBarBackground.appId).get(model.formAppBarBackground.documentID).then((val) {
          formAppBarBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel listBackgroundHolder;
    if (model.listBackground != null) {
      try {
        await backgroundRepository(appId: model.listBackground.appId).get(model.listBackground.documentID).then((val) {
          listBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h1Holder;
    if (model.h1 != null) {
      try {
        await fontRepository(appId: model.h1.appId).get(model.h1.documentID).then((val) {
          h1Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h2Holder;
    if (model.h2 != null) {
      try {
        await fontRepository(appId: model.h2.appId).get(model.h2.documentID).then((val) {
          h2Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h3Holder;
    if (model.h3 != null) {
      try {
        await fontRepository(appId: model.h3.appId).get(model.h3.documentID).then((val) {
          h3Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h4Holder;
    if (model.h4 != null) {
      try {
        await fontRepository(appId: model.h4.appId).get(model.h4.documentID).then((val) {
          h4Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h5Holder;
    if (model.h5 != null) {
      try {
        await fontRepository(appId: model.h5.appId).get(model.h5.documentID).then((val) {
          h5Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontTextHolder;
    if (model.fontText != null) {
      try {
        await fontRepository(appId: model.fontText.appId).get(model.fontText.documentID).then((val) {
          fontTextHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontHighlight1Holder;
    if (model.fontHighlight1 != null) {
      try {
        await fontRepository(appId: model.fontHighlight1.appId).get(model.fontHighlight1.documentID).then((val) {
          fontHighlight1Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontHighlight2Holder;
    if (model.fontHighlight2 != null) {
      try {
        await fontRepository(appId: model.fontHighlight2.appId).get(model.fontHighlight2.documentID).then((val) {
          fontHighlight2Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontLinkHolder;
    if (model.fontLink != null) {
      try {
        await fontRepository(appId: model.fontLink.appId).get(model.fontLink.documentID).then((val) {
          fontLinkHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        logo: logoHolder,

        formBackground: formBackgroundHolder,

        formAppBarBackground: formAppBarBackgroundHolder,

        listBackground: listBackgroundHolder,

        h1: h1Holder,

        h2: h2Holder,

        h3: h3Holder,

        h4: h4Holder,

        h5: h5Holder,

        fontText: fontTextHolder,

        fontHighlight1: fontHighlight1Holder,

        fontHighlight2: fontHighlight2Holder,

        fontLink: fontLinkHolder,


    );
  }

}

