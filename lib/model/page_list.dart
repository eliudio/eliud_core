/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/screen_size.dart';

import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/page_list_event.dart';
import 'package:eliud_core/model/page_list_state.dart';
import 'package:eliud_core/model/page_list_bloc.dart';
import 'package:eliud_core/model/page_model.dart';

import 'page_form.dart';
class PageListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  PageListWidgetState state;
  bool isEmbedded;

  PageListWidget({ Key key, this.readOnly, this.form, this.isEmbedded }): super(key: key);

  @override
  PageListWidgetState createState() {
    state ??= PageListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= PageListWidgetState();
    return state.fab(context);
  }
}

class PageListWidgetState extends State<PageListWidget> {
  PageListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<PageListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose () {
    if (bloc != null) bloc.close();
    super.dispose();
  }

  @override
  Widget fab(BuildContext aContext) {
    return !GlobalData.memberIsOwner()  
        ? null
        :FloatingActionButton(
      heroTag: "PageFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: PageForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageListBloc, PageListState>(builder: (context, state) {
      if (state is PageListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PageListLoaded) {
        final values = state.values;
        if ((widget.isEmbedded != null) && (widget.isEmbedded)) {
          List<Widget> children = List();
          children.add(theList(context, values));
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: () {
                    Navigator.of(context).push(
                              pageRouteBuilder(page: BlocProvider.value(
                                  value: bloc,
                                  child: PageForm(
                                      value: null,
                                      formAction: FormAction.AddAction)
                              )),
                            );
                  },
                  child: Text('Add', style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonTextColor))),
                ));
          return ListView(
            padding: const EdgeInsets.all(8),
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: children
          );
        } else {
          return theList(context, values);
        }
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
  
  Widget theList(BuildContext context, values) {
    return Container(
      decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().listBackground),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)
        ),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          return PageListItem(
            value: value,
            onDismissed: (direction) {
              BlocProvider.of<PageListBloc>(context)
                  .add(DeletePageList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "Page " + value.documentID,
                onUndo: () => BlocProvider.of<PageListBloc>(context)
                    .add(AddPageList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<PageListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Page " + value.documentID,
                            onUndo: () => BlocProvider.of<PageListBloc>(context)
                                .add(AddPageList(value: value)),
                          ),
                        );
                      }

            },
          );
        }
      ));
  }
  
  
  Widget getForm(value, action) {
    if (widget.form == null) {
      return PageForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class PageListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final PageModel value;

  PageListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Page_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__PageheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.documentID,
              style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
            )),
          ),
        ),
        subtitle: (value.title != null) && (value.title.isNotEmpty)
            ? Center( child: Text(
          value.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
        ))
            : null,
      ),
    );
  }
}

