import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatorMode extends StatefulWidget {
  final bool edit;
  final String label;
  final Widget toDecorate;
  final GlobalKey toDecorateKey;

  CreatorMode({Key? key, required this.toDecorateKey, required this.edit, required this.toDecorate, required this.label})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreatorModeState();
  }

  static CreatorMode create({Key? key, required GlobalKey toDecorateKey, required bool edit, required Widget toDecorate, required String label}) {
    return CreatorMode(key: key, toDecorateKey: toDecorateKey, edit: edit, toDecorate: toDecorate, label: label);
  }
}

class CreatorModeState extends State<CreatorMode> {
  Offset? position = Offset(20, 20);
  final double width = 100;
  final double height = 20;
  GlobalKey _buttonKey = GlobalKey();

  CreatorModeState();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(_getWidgetInfo);
  }

  void _getWidgetInfo(_) {
    var renderObject = widget.toDecorateKey.currentContext?.findRenderObject();
    var renderButtonObject = _buttonKey.currentContext?.findRenderObject();
    if ((renderObject is RenderBox) && (renderButtonObject is RenderBox)) {
      var renderBox = renderObject;
      var renderButtonBox = renderButtonObject;

      var sizeBox = renderBox.size;
      var sizeButtonBox = renderButtonBox.size;

      setState(() {
        position = Offset((sizeBox.width - sizeButtonBox.width) / 2, (sizeBox.height - sizeButtonBox.height) / 2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.edit) {
      return widget.toDecorate;
    } else {
      var button2 = Container(width: width, height: height, child: ElevatedButton.icon(
          onPressed: () => print("aaaa"),
          icon: Icon(
            Icons.edit,
            color: Colors.red,
            size: 15,
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(.1)),
              padding: MaterialStateProperty.all(EdgeInsets.all(5)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
          label: Text(widget.label,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white))));

      var draggable = Draggable(
          key: _buttonKey,
          feedback: button2,
          child: button2,
          childWhenDragging: Container(),
          onDragEnd: (DraggableDetails details) {
            setState(() {
              onDrag(details);
            });
          });

      return Stack(children: [
        widget.toDecorate,
        Positioned(
            left: position!.dx,
            top: position!.dy,
            child: draggable),
      ]);
    }
  }

  void onDrag(DraggableDetails details) {
    var renderObject = context.findRenderObject();
    if ((renderObject != null) && (renderObject is RenderBox)) {
      var size = renderObject.size;
      var newPosition =
      renderObject.globalToLocal(details.offset);
      position = Offset(
          min(max(0, newPosition.dx), size.width - width), min(max(0, newPosition.dy), size.height - height));
    }
  }
}


