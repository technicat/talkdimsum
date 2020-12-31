import 'package:url_launcher/url_launcher.dart';

class Link {
  final String name;
  final String url;

  Link(this.name, this.url);

  Link.fromJson(Map<String, dynamic> json) :
  	 name = json['name'],
  	 url = json['URL'];


  void goto() {
    launch(url);
  }
}
