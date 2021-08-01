import 'dart:convert';

class CaltelogModels {
//singleton
  static final catModel = CaltelogModels._internal();

  CaltelogModels._internal();

  factory CaltelogModels() => catModel;

  static List<Item> items = [
    // Item(
    //   id: 1,
    //   name: "nith",
    //   price: 999,
    //   color: "#353728",
    //   image: "",
    // ),
  ];

//get items by Id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // get itme by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.price, this.color, this.image);

  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //       id: map["id"],
  //       name: map["name"],
  //       price: map["price"],
  //       color: map["color"],
  //       image: map["image"]);
  // }

  // toMap() =>
  //     {"id": id, "name": name, "price": price, "color": color, "image": image};

  Item copyWith({
    int? id,
    String? name,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['name'],
      map['price'],
      map['color'],
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
