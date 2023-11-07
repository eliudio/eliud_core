import 'package:flutter/material.dart';

class DeleteSnackBar extends SnackBar {
  DeleteSnackBar({
    super.key,
    required String message,
    required VoidCallback onUndo,
  }) : super(
          content: Text(
            'Deleted $message',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: onUndo,
          ),
        );
}
