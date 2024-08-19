class adminModel {
  String? email;
  String? id;
  String? name;
  String? password;
  bool? issuperAdmin;
  bool? isviewonly;

  adminModel(
      {this.email,
      this.password,
      this.issuperAdmin,
      this.id,
      this.isviewonly,
      this.name});
  adminModel.fromJson(json, id) {
    this.id = id;
    email = json["email"];
    name = json["name"];
    password = json["password"];
    issuperAdmin = json["issuperAdmin"];
    isviewonly = json["isviewonly"];
  }
  toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'name': this.name,
      'issuperAdmin': this.issuperAdmin,
      'isviewonly': this.isviewonly,
    };
  }
}
