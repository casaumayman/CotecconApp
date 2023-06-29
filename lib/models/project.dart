class Project {
  int? id;
  String? code;
  String? name;
  String? address;
  String? startDate;
  String? endDate;

  Project(
      {this.id,
      this.code,
      this.name,
      this.address,
      this.startDate,
      this.endDate});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    address = json['address'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['address'] = this.address;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
