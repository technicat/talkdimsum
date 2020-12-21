
class Photo {
  final String name;
  final String place;

  Photo(this.name,this.place);

  Photo.fromJson(Map<String, dynamic> json) : name = json['image'], place = json['place'];
}
