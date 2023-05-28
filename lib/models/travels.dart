class PassTravel {
  num? id;
  Travel? travel;
  Captine? captine;
  String? date;
  List<num>? passenger;

  PassTravel({this.id, this.travel, this.captine, this.date, this.passenger});

  PassTravel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    travel =
        json['travel'] != null ? new Travel.fromJson(json['travel']) : null;
    captine =
        json['captine'] != null ? new Captine.fromJson(json['captine']) : null;
    date = json['date'];
    passenger = json['passenger'].cast<num>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.travel != null) {
      data['travel'] = this.travel!.toJson();
    }
    if (this.captine != null) {
      data['captine'] = this.captine!.toJson();
    }
    data['date'] = this.date;
    data['passenger'] = this.passenger;
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

class Captine {
  num? id;
  Travel? travel;
  String? name;
  num? busNo;

  Captine({this.id, this.travel, this.name, this.busNo});

  Captine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    travel =
        json['travel'] != null ? new Travel.fromJson(json['travel']) : null;
    name = json['name'];
    busNo = json['bus_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.travel != null) {
      data['travel'] = this.travel!.toJson();
    }
    data['name'] = this.name;
    data['bus_no'] = this.busNo;
    return data;
  }
}
