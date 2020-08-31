/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/model/pos_size_component_bloc.dart';
import 'package:eliud_core/model/pos_size_component_event.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/pos_size_repository.dart';
import 'package:eliud_core/model/pos_size_component_state.dart';

abstract class AbstractPosSizeComponent extends StatelessWidget {
  static String componentName = "posSizes";
  final String posSizeID;

  AbstractPosSizeComponent({this.posSizeID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PosSizeBloc> (
          create: (context) => PosSizeBloc(
            posSizeRepository: getPosSizeRepository())
        ..add(FetchPosSize(id: posSizeID)),
      child: _posSizeBlockBuilder(context),
    );
  }

  Widget _posSizeBlockBuilder(BuildContext context) {
    return BlocBuilder<PosSizeBloc, PosSizeState>(builder: (context, state) {
      if (state is PosSizeLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No posSize defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PosSizeError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PosSizeModel value);
  Widget alertWidget({ title: String, content: String});
  PosSizeRepository getPosSizeRepository();
}


