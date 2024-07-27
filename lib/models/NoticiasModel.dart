class Noticias {
  Noticias({
    required this.id,
    required this.name,
    required this.description,
    required this.urlImage,
    required this.isPositive,
    required this.createdAt,
    required this.updatedAt,
    required this.accountId,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String urlImage;
  late final int isPositive;
  late final String createdAt;
  late final String updatedAt;
  late final String accountId;

  Noticias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    urlImage = json['url_image'];
    isPositive = json['is_positive'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountId = json['account_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['url_image'] = urlImage;
    _data['is_positive'] = isPositive;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['account_id'] = accountId;
    return _data;
  }
}
