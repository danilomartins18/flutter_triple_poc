import 'package:flutter/material.dart';

import '../theme.dart';

class Spinner extends StatefulWidget {
  final Color? backgroundColor;
  final bool showText;

  Spinner({this.backgroundColor, this.showText = false});

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  bool _displayText = false;

  @override
  void initState() {
    super.initState();

    if (widget.showText) {
      Future.delayed(const Duration(seconds: 5), () {
        if (!this.mounted) return;
        setState(() {
          this._displayText = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          children: <Widget>[
            CircularProgressIndicator(
              backgroundColor: widget.backgroundColor ?? Colors.greenAccent,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 8.0),
            _displayText ? Text("Carregando", style: TextStyle(fontFamily: kDefaultFont)) : Container()
          ],
        )));
  }
}
