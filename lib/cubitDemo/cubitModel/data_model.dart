class DataModel {
  DataModel({
    required this.image,
    required this.price,
    required this.name,

  });
  late String image;
  late String price;
  late String name;


  DataModel.fromJson(Map<String, dynamic> json) {
    image = json['img'].toString() ?? '';
    price = json['price'].toString() ?? '';
    name = json['name'] ?? '';

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['img'] = image;
    data['price'] = price;

    data['name'] = name;
    return data;
  }
}