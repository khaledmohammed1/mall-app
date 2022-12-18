class CategoryModel {
  String? name;
  String? icon;
  List<String>? subCategories;

  CategoryModel({
    this.name,
    this.icon,
    this.subCategories,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    icon = json['icon'] as String?;
    subCategories = (json['subCategories'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['icon'] = icon;
    json['subCategories'] = subCategories;
    return json;
  }
}
