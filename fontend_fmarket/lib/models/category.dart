class Category {
  int? id;
  String? name;
  int? rank;

  Category({this.id, this.name, this.rank});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rank'] = this.rank;
    return data;
  }
}
