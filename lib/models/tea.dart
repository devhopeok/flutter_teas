import 'dart:convert';
import 'package:meta/meta.dart';

class Tea {
  Tea({
    @required this.avatar,
    @required this.name,
    @required this.email,
    @required this.location,
  });

  final String avatar;
  final String name;
  final String email;
  final String location;

  static List<Tea> allFromResponse(String response) {
    var decodedJson = json.decode(response).cast<String, dynamic>();

    return decodedJson['results']
        .cast<Map<String, dynamic>>()
        .map((obj) => Tea.fromMap(obj))
        .toList()
        .cast<Tea>();
  }

  static Tea fromMap(Map map) {
    var name = map['name'];

    return new Tea(
      avatar: map['picture']['large'],
      name: '${_capitalize(name['first'])} ${_capitalize(name['last'])}',
      email: map['email'],
      location: _capitalize(map['location']['state']),
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}
