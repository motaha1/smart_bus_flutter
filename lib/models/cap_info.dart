class captine {
  num? id;
  Travel? travel;
  String? name;

  captine({this.id, this.travel, this.name});

  captine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    travel =
        json['travel'] != null ? new Travel.fromJson(json['travel']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.travel != null) {
      data['travel'] = this.travel!.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Travel {
  num? id;
  String? name;
  num? price;

  Travel({this.id, this.name, this.price});

  Travel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
