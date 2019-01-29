import 'package:flutter/material.dart';
import 'package:flutter_tea/models/tea.dart';
import 'package:meta/meta.dart';

class TeaDetailHeader extends StatelessWidget {
  static const BACKGROUND_IMAGE = 'images/tea_details.jpg';

  TeaDetailHeader(this.tea, {
    @required this.avatarTag,
  });

  final Tea tea;
  final Object avatarTag;

  Widget _buildDiagonalImageBackground(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      padding: new EdgeInsets.all(10.0),
      child: new Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 260.0,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        _buildDiagonalImageBackground(context),
        new Positioned(
          top: 26.0,
          left: 4.0,
          child: new BackButton(color: Colors.black),
        ),
      ],
    );
  }
}
