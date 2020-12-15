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
              var components = helper.getComponents(state.value.bodyComponents, parameters);
              var theBody = helper.theBody(context, accessState,
                  backgroundDecoration: state.value.background,
                  components: components,
                  layout: fromDialogLayout(state.value.layout),
                  gridView: state.value.gridView);
              return Container(
                margin: EdgeInsets.only(left: 0.0,right: 0.0),
                child: Stack(
                  children: <Widget>[
                    theBody,
/*                    Container(
                      padding: EdgeInsets.only(
                        top: 18.0,
                      ),
                      margin: EdgeInsets.only(top: 13.0,right: 8.0),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new Text("Sorry please try \n again tomorrow", style:TextStyle(fontSize: 30.0,color: Colors.white)),
                              )//
                          ),
                          SizedBox(height: 24.0),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0)),
                              ),
                              child:  Text(
                                "OK",
                                style: TextStyle(color: Colors.blue,fontSize: 25.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap:(){
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),*/
                    //widget,
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
