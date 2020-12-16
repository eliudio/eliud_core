import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/components/page_body_helper.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/dialog_component_bloc.dart';
import 'package:eliud_core/model/dialog_component_event.dart';
import 'package:eliud_core/model/dialog_component_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

// ignore: must_be_immutable
class DialogComponent extends StatelessWidget {
//  final String appID;
  final String dialogID;
  final Map<String, Object> parameters;

  DialogComponent({this.dialogID, this.parameters});

  @override
  Widget build(BuildContext context) {
    var appID = AccessBloc.appId(context);
    var accessState = AccessBloc.getState(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider<DialogComponentBloc>(
            create: (context) => DialogComponentBloc(
                dialogRepository: AbstractRepositorySingleton.singleton
                    .dialogRepository(appID))
              ..add(FetchDialogComponent(id: dialogID)),
          ),
        ],
        child: BlocBuilder<DialogComponentBloc, DialogComponentState>(
            builder: (context, state) {
          if (state is DialogComponentLoaded) {
            if (state.value == null) {
              return AlertWidget(title: 'Error', content: 'No dialog defined');
            } else {
              var helper = PageBodyHelper();
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                margin: EdgeInsets.only(left: 0.0,right: 0.0),
                child: Stack(
                  children: <Widget>[
//                    state.value.title
                    helper.theBody(context, accessState,
                        backgroundDecoration: state.value.background,
                        components: helper.getComponents(state.value.bodyComponents, parameters),
                        layout: fromDialogLayout(state.value.layout),
                        gridView: state.value.gridView),
                    Positioned(
                      right: 0.0,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 14.0,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.close, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else if (state is DialogComponentError) {
            return Text(state.message);
          } else {
            return Center(
              child: DelayedCircularProgressIndicator(),
            );
          }
        }));
  }
}
