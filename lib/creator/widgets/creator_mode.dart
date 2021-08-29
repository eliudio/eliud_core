import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatorButton extends StatefulWidget {
  static double BUTTON_HEIGHT = 35;
  static Color BACKGROUND_COLOR = Colors.green.withOpacity(.3);
  static Color ICON_COLOR = Colors.red;
  static Color BORDER_COLOR = Colors.red;
  static Color TEXT_COLOR = Colors.white;

  final bool edit;
  final String? label;
  final Widget toDecorate;
  final GlobalKey toDecorateKey;

  CreatorButton({Key? key, required this.toDecorateKey, required this.edit, required this.toDecorate, this.label})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreatorButtonState();
  }

  static CreatorButton create({Key? key, required GlobalKey toDecorateKey, required bool edit, required Widget toDecorate, String? label}) {
    return CreatorButton(key: key, toDecorateKey: toDecorateKey, edit: edit, toDecorate: toDecorate, label: label);
  }
}

class _CreatorButtonState extends State<CreatorButton> {
  Offset? position = Offset(20, 20);
  double? width;
  double? height;

  final _buttonKey = GlobalKey();

  _CreatorButtonState();

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

      width = sizeButtonBox.width;
      height = sizeButtonBox.height;

      setState(() {
        position = Offset((sizeBox.width - width!) / 2, (sizeBox.height - height!) / 2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.edit) {
      return widget.toDecorate;
    } else {
      var button;
      var icon = Icon(
        Icons.edit,
        color: CreatorButton.ICON_COLOR,
        size: 15,
      );
      if (widget.label == null) {
        button = Container(height: CreatorButton.BUTTON_HEIGHT, width: CreatorButton.BUTTON_HEIGHT, decoration: BoxDecoration(
            color: CreatorButton.BACKGROUND_COLOR,
            border: Border.all(
                width: 1,
                color: CreatorButton.BORDER_COLOR
            )),
            child: GestureDetector(
                onTap: () => _doIt(),
                child: icon));
      } else {
        button = Container(height: CreatorButton.BUTTON_HEIGHT, decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: CreatorButton.BORDER_COLOR
            )),
            child: ElevatedButton.icon(
                onPressed: () => _doIt(),
                icon: icon,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        CreatorButton.BACKGROUND_COLOR),
                    padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 30))),
                label: Text(widget.label!,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.normal,
                        color: CreatorButton.TEXT_COLOR))));
      }

      var draggable = Draggable(
          key: _buttonKey,
          feedback: button,
          child: button,
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
          min(max(0, newPosition.dx), size.width - width!), min(max(0, newPosition.dy), size.height - height!));
    }
  }

  void _doIt() {
  }
}


