/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_list.dart
                       
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

import 'package:eliud_core/model/image_list_event.dart';
import 'package:eliud_core/model/image_list_state.dart';
import 'package:eliud_core/model/image_list_bloc.dart';
import 'package:eliud_core/model/image_model.dart';

import 'image_form.dart';
class ImageListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  ImageListWidgetState state;

  ImageListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  ImageListWidgetState createState() {
    state ??= ImageListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= ImageListWidgetState();
    return state.fab(context);
  }
}

class ImageListWidgetState extends State<ImageListWidget> {
  ImageListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<ImageListBloc>(context);
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
      heroTag: "ImageFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: ImageForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageListBloc, ImageListState>(builder: (context, state) {
      if (state is ImageListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ImageListLoaded) {
        final values = state.values;
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
                     return ImageListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<ImageListBloc>(context)
                             .add(DeleteImageList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "Image " + value.documentID,
                           onUndo: () => BlocProvider.of<ImageListBloc>(context)
                               .add(AddImageList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<ImageListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Image " + value.documentID,
                            onUndo: () => BlocProvider.of<ImageListBloc>(context)
                                .add(AddImageList(value: value)),
                          ),
                        );
                      }

                       },
                     );
                   }
               ));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
  
  Widget getForm(value, action) {
    if (widget.form == null) {
      return ImageForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class ImageListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ImageModel value;

  ImageListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Image_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__ImageheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.documentID,
              style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
            )),
          ),
        ),
        subtitle: (value.imageURLThumbnail != null) && (value.imageURLThumbnail.isNotEmpty)
            ? Center( child: ImageHelper.getThumbnailFromImageModel(imageModel: value, width: fullScreenWidth(context)))
            : null,
      ),
    );
  }
}

