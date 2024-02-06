class EvertecUsers {
  final String name;
  final String password;
  final int idType;

  EvertecUsers({
    required this.name,
    required this.password,
    required this.idType,
  });

  factory EvertecUsers.fromJson(Map<String, dynamic> json) => EvertecUsers(
    name: json["name"],
    password: json["password"],
    idType: json["idType"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    "idType": idType,
  };
}
