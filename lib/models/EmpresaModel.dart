class EmpresaModel {
  EmpresaModel({
    required this.id,
    required this.name,
    required this.priceAction,
    required this.totalActions,
    required this.availableActions,
    required this.urlImage,
    required this.createdAt,
    required this.updatedAt,
    required this.papersRentFixedId,
    required this.accountId,
  });
  late final String id;
  late final String name;
  late final String priceAction;
  late final int totalActions;
  late final int availableActions;
  late final String urlImage;
  late final String createdAt;
  late final String updatedAt;
  late final String papersRentFixedId;
  late final String accountId;

  EmpresaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    priceAction = json['price_action'];
    totalActions = json['total_actions'];
    availableActions = json['available_actions'];
    urlImage = json['url_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    papersRentFixedId = json['papers_rent_fixed_id'];
    accountId = json['account_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price_action'] = priceAction;
    _data['total_actions'] = totalActions;
    _data['available_actions'] = availableActions;
    _data['url_image'] = urlImage;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['papers_rent_fixed_id'] = papersRentFixedId;
    _data['account_id'] = accountId;
    return _data;
  }
}
