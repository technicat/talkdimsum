
class Link {
  final String name;
  final String URL;

  Link(this.name, this.URL);

  Link.fromJson(Map<String, dynamic> json) :
  	 name = json['name'],
  	 URL = json['URL'];
}
