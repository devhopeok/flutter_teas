import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tea/utils/api_client.dart';
import 'package:flutter_tea/screens/tea_details/tea_details_page.dart';
import 'package:flutter_tea/models/tea.dart';

class TeasListPage extends StatefulWidget {
  @override
  _TeasListPageState createState() => new _TeasListPageState();
}

class _TeasListPageState extends State<TeasListPage> {
  ApiClient _apiClient = ApiClient();
  List<Tea> _teas = [];

  @override
  void initState() {
    super.initState();
    _loadTeas();
  }

  Future<void> _loadTeas() async {
    var response = await _apiClient.getTeasList();

    setState(() {
      _teas = Tea.allFromResponse(response.body);
    });
  }

  Widget _buildTeaListTile(BuildContext context, int index) {
    var tea = _teas[index];
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return new Container(
      child: new ListTile(
        onTap: () => _navigateToTeaDetails(tea, index),
        title: new Container(
            padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new NetworkImage(tea.avatar),
                  radius: 45.0,
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        tea.name,
                        style: textTheme.body1.copyWith(color: Colors.black54, fontSize: 22.0),
                      ),
                      new Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Row(
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage: new NetworkImage(tea.avatar),
                              radius: 15.0,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: new Text(
                                tea.name,
                                style: textTheme.body1.copyWith(color: Colors.black38, fontSize: 16.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(color: Colors.black12),
        ),
      ),
    );
  }

  void _navigateToTeaDetails(Tea tea, Object avatarTag) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new TeaDetailsPage(tea, avatarTag: avatarTag);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_teas.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _teas.length,
        itemBuilder: _buildTeaListTile,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Teas')),
      body: content,
    );
  }
}
