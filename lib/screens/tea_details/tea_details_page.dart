import 'package:flutter/material.dart';
import 'package:flutter_tea/screens/tea_details/tea_detail_body.dart';
import 'package:flutter_tea/screens/tea_details/tea_detail_header.dart';
import 'package:flutter_tea/models/tea.dart';
import 'package:meta/meta.dart';

class TeaDetailsPage extends StatefulWidget {
  TeaDetailsPage(
      this.tea, {
        @required this.avatarTag,
      });

  final Tea tea;
  final Object avatarTag;

  @override
  _TeaDetailsPageState createState() => new _TeaDetailsPageState();
}

class _TeaDetailsPageState extends State<TeaDetailsPage> {
  @override
  Widget build(BuildContext context) {

    void _runInfuser() {}
    var screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child:         new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new TeaDetailHeader(
                  widget.tea,
                  avatarTag: widget.avatarTag,
                ),
                new Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: new TeaDetailBody(widget.tea),
                ),
                new Container(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: new OutlineButton(
                      onPressed: _runInfuser,
                      child: new Text('Run Infuser'),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
