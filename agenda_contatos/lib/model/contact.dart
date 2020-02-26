class Contact {
  int id;
  String name;
  String email;
  String phone;
  String picture;

  static final String tableName = "contact";
  static final String idColumn = "id";
  static final String nameColumn = "name";
  static final String emailColumn = "email";
  static final String phoneColumn = "phone";
  static final String pictureColumn = "picture";

  Contact();

  Contact.fromMap(Map<String, dynamic> map)
      : id = map[idColumn],
        name = map[nameColumn],
        email = map[emailColumn],
        phone = map[phoneColumn],
        picture = map[pictureColumn];

  Map<String, dynamic> toMap() {
    return {
      idColumn: id,
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      pictureColumn: picture
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
