class TurnoModel {
  TurnoModel({
    required this.papersRentFixedId,
    required this.newsPositiveId,
    required this.newsNegativeId,
    required this.round,
    required this.companies,
  });
  late final String papersRentFixedId;
  late final String newsPositiveId;
  late final String newsNegativeId;
  late final int round;
  late final List<Companies> companies;

  TurnoModel.fromJson(Map<String, dynamic> json) {
    papersRentFixedId = json['papers_rent_fixed_id'];
    newsPositiveId = json['news_positive_id'];
    newsNegativeId = json['news_negative_id'];
    round = json['round'];
    companies =
        List.from(json['companies']).map((e) => Companies.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['papers_rent_fixed_id'] = papersRentFixedId;
    _data['news_positive_id'] = newsPositiveId;
    _data['news_negative_id'] = newsNegativeId;
    _data['round'] = round;
    _data['companies'] = companies.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Companies {
  Companies({
    required this.companyId,
    required this.actionsBuy,
    required this.actionsSell,
  });
  late final String companyId;
  late final int actionsBuy;
  late final int actionsSell;

  Companies.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    actionsBuy = json['actions_buy'];
    actionsSell = json['actions_sell'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['company_id'] = companyId;
    _data['actions_buy'] = actionsBuy;
    _data['actions_sell'] = actionsSell;
    return _data;
  }
}
