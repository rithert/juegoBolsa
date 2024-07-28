class SalasModel {
  SalasModel({
    required this.id,
    required this.transmitter,
    required this.paper,
    required this.unitValue,
    required this.interest,
    required this.validity,
    required this.urlImage,
    required this.createdAt,
    required this.updatedAt,
    required this.accountId,
  });
  late final String id;
  late final String transmitter;
  late final String paper;
  late final String unitValue;
  late final String interest;
  late final int validity;
  late final String urlImage;
  late final String createdAt;
  late final String updatedAt;
  late final String accountId;

  SalasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transmitter = json['transmitter'];
    paper = json['paper'];
    unitValue = json['unit_value'];
    interest = json['interest'];
    validity = json['validity'];
    urlImage = json['url_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountId = json['account_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['transmitter'] = transmitter;
    _data['paper'] = paper;
    _data['unit_value'] = unitValue;
    _data['interest'] = interest;
    _data['validity'] = validity;
    _data['url_image'] = urlImage;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['account_id'] = accountId;
    return _data;
  }
}
