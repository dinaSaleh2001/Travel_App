
class DataModel {
  String name;
  String imge;
  String description;
  int price;
  int people;
  int starts;
  String location;

  DataModel({
    required this.description,
    required this.imge,
    required this.location,
    required this.name,
    required this.starts,
    required this.people,
    required this.price,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      description: json["description"],
      imge: json["img"],
      location: json["location"],
      name: json["name"],
      starts: json["stars"],
      people: json["people"],
      price: json["price"],
    );
  }
}
