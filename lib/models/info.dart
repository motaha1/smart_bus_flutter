class info {
  int? id;
  String? no;
  String? name;
  String? card;
  int? funds;

  info({this.id, this.no, this.name, this.card, this.funds});

  info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    no = json['no'];
    name = json['name'];
    card = json['card'];
    funds = json['funds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no'] = this.no;
    data['name'] = this.name;
    data['card'] = this.card;
    data['funds'] = this.funds;
    return data;
  }
}