class Category {
  String id;
  String title;
  String icon;

  Category.fromMap(String id, Map<String, dynamic> map)
      : this.id = id,
        this.title = map["title"],
        this.icon = map["icon"];

  Map<String, dynamic> get toMap =>
      {"id": this.id, "title": this.title, "icon": this.icon};
}
