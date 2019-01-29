import 'package:flutter/material.dart';
import 'package:flutter_tea/models/tea.dart';

class TeaDetailBody extends StatelessWidget {
  TeaDetailBody(this.tea);
  final Tea tea;

  Widget _buildLocationInfo(TextTheme textTheme) {
    return new Row(
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage(tea.avatar),
          radius: 16.0,
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: new Text(
            tea.location,
            style: textTheme.subhead.copyWith(color: Colors.black54),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          tea.name,
          style: textTheme.headline.copyWith(color: Colors.black54),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: _buildLocationInfo(textTheme),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s. Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard dummy '
            'text ever since the 1500s.',
            style: textTheme.body1.copyWith(color: Colors.black54, fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
