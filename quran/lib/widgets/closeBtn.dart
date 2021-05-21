import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.0001,
      left: MediaQuery.of(context).size.width * 0.0001,
      child: IconButton(
        icon: Icon(Icons.close),
        color: Colors.brown[600],
        onPressed: () => Navigator.pop(context),
        splashColor: Color(0xff04364f),
        iconSize: MediaQuery.of(context).size.height * 0.03,
        tooltip: 'أغلق',
      ),
    );
  }
}
