class Data {
  int id;
  String name;
  String age;
  String hobby;
  String image_path;

  Data({this.id, this.age, this.hobby, this.image_path, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'].toString();
    hobby = json['hobby'];
    image_path = json['image_path'];
  }

  toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'hobby': hobby,
      'image_path': image_path,
    };
  }
}
