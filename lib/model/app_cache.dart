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
import 'app_model.dart';
import 'app_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

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

  Future<AppModel> get(String id){
    AppModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
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
  Stream<List<AppModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<AppModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<AppModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<AppModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<AppModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<AppModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<AppModel> refreshRelations(AppModel model) async {

    PageModel entryPageHolder;
    if (model.entryPage != null) {
      try {
        await pageRepository().get(model.entryPage.documentID).then((val) {
          entryPageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    ImageModel logoHolder;
    if (model.logo != null) {
      try {
        await imageRepository().get(model.logo.documentID).then((val) {
          logoHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel formBackgroundHolder;
    if (model.formBackground != null) {
      try {
        await backgroundRepository().get(model.formBackground.documentID).then((val) {
          formBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel formAppBarBackgroundHolder;
    if (model.formAppBarBackground != null) {
      try {
        await backgroundRepository().get(model.formAppBarBackground.documentID).then((val) {
          formAppBarBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel listBackgroundHolder;
    if (model.listBackground != null) {
      try {
        await backgroundRepository().get(model.listBackground.documentID).then((val) {
          listBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h1Holder;
    if (model.h1 != null) {
      try {
        await fontRepository().get(model.h1.documentID).then((val) {
          h1Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h2Holder;
    if (model.h2 != null) {
      try {
        await fontRepository().get(model.h2.documentID).then((val) {
          h2Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h3Holder;
    if (model.h3 != null) {
      try {
        await fontRepository().get(model.h3.documentID).then((val) {
          h3Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h4Holder;
    if (model.h4 != null) {
      try {
        await fontRepository().get(model.h4.documentID).then((val) {
          h4Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h5Holder;
    if (model.h5 != null) {
      try {
        await fontRepository().get(model.h5.documentID).then((val) {
          h5Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontTextHolder;
    if (model.fontText != null) {
      try {
        await fontRepository().get(model.fontText.documentID).then((val) {
          fontTextHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontHighlight1Holder;
    if (model.fontHighlight1 != null) {
      try {
        await fontRepository().get(model.fontHighlight1.documentID).then((val) {
          fontHighlight1Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontHighlight2Holder;
    if (model.fontHighlight2 != null) {
      try {
        await fontRepository().get(model.fontHighlight2.documentID).then((val) {
          fontHighlight2Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontLinkHolder;
    if (model.fontLink != null) {
      try {
        await fontRepository().get(model.fontLink.documentID).then((val) {
          fontLinkHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        entryPage: entryPageHolder,

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

