import 'package:eliud_core/core/blocs/access/access_bloc.dart';

import 'package:eliud_core/model/access_model.dart';

import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/member_model.dart';

import 'package:eliud_core/package/package.dart';

import 'core_package.dart';

class CoreMobilePackage extends CorePackage {
  @override
  void init() {
    super.init();
    // initialise the platform... nothing now
  }

  @override
  List<Object?> get props => [
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is CoreMobilePackage &&
              runtimeType == other.runtimeType;


}
