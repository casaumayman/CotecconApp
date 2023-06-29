class Executor {
  int? id;
  String? code;
  String? name;
  Representer? representer;
  String? address;
  String? phone;
  String? email;

  Executor(
      {this.id,
      this.code,
      this.name,
      this.representer,
      this.address,
      this.phone,
      this.email});

  Executor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    representer = json['representer'] != null
        ? new Representer.fromJson(json['representer'])
        : null;
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    if (this.representer != null) {
      data['representer'] = this.representer!.toJson();
    }
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}

class Representer {
  int? id;
  String? name;

  Representer({this.id, this.name});

  Representer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
