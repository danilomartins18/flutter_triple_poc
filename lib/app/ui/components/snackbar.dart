import 'package:flutter/material.dart';

enum TypeMessage { SUCCESS, FAIL, WARNING, INFO, NOCONNECTION }

SnackBar snackBar({
  String message = "",
  TypeMessage type = TypeMessage.INFO,
}) {
  Color returnColor(TypeMessage type) {
    switch (type) {
      case TypeMessage.SUCCESS:
        return Colors.green;
      case TypeMessage.FAIL:
        return Colors.red;
      case TypeMessage.WARNING:
        return Colors.amber;
      case TypeMessage.INFO:
        return Colors.blue;
      case TypeMessage.NOCONNECTION:
        return Colors.black87;
      default:
        return Colors.black87;
    }
  }

  return SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: returnColor(type),
  );
}
