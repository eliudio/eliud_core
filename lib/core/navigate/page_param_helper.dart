import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/cupertino.dart';

class PageContextInfo {
  final String appId;
  final String pageId;
  Map<String, dynamic>? parameters;

  PageContextInfo(this.appId, this.pageId, {this.parameters});
}

class PageParamHelper {
  static PageContextInfo getPagaContextInfo(BuildContext context) {
    var modalRoute = ModalRoute.of(context) as ModalRoute;
    var app = AccessBloc.app(context);
    return getPagaContextInfoWithRoutAndApp(modalRoute, app);
  }

  static PageContextInfo getPagaContextInfoWithRoutAndApp(ModalRoute modalRoute, AppModel? app) {
    if (app == null) {
      throw Exception('No app selected');
    }
    var settings = modalRoute.settings;
    var appId = app.documentID;
    if (appId == null) {
      throw Exception('No app selected');
    }
    var fullPageId = settings.name;
    if (fullPageId == null) {
      throw Exception('No page selected');
    }
    var pageId = settings.name!.substring(appId.length + 1);
    Map<String, dynamic>? parameters;
    if (settings.arguments != null) {
      parameters = settings.arguments as Map<String, dynamic>;
    }
    return PageContextInfo(appId, pageId, parameters: parameters);
  }
}
