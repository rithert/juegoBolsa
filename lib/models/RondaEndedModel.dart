class RondaEndModel {
  RondaEndModel({
    required this.round,
    required this.totalBuy,
    required this.totalSell,
    required this.userBalance,
    required this.playerRound,
    required this.totalRounds,
    required this.userId,
    required this.variationPricesPlay,
  });
  late final int round;
  late final int totalBuy;
  late final int totalSell;
  late final int userBalance;
  late final int playerRound;
  late final int totalRounds;
  late final String? userId;
  late final List<VariationPricesPlay> variationPricesPlay;

  RondaEndModel.fromJson(Map<String, dynamic> json) {
    round = json['round'];
    totalBuy = json['total_buy'];
    totalSell = json['total_sell'];
    userBalance = json['user_balance'];
    playerRound = json['player_round'];
    totalRounds = json['total_rounds'];
    userId = json['user_id'];
    variationPricesPlay = List.from(json['variation_prices_play'])
        .map((e) => VariationPricesPlay.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['round'] = round;
    _data['total_buy'] = totalBuy;
    _data['total_sell'] = totalSell;
    _data['user_balance'] = userBalance;
    _data['player_round'] = playerRound;
    _data['total_rounds'] = totalRounds;
    _data['user_id'] = userId;
    _data['variation_prices_play'] =
        variationPricesPlay.map((e) => e.toJson()).toList();
    return _data;
  }
}

class VariationPricesPlay {
  VariationPricesPlay({
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
    required this.variation,
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
  late final String variation;

  VariationPricesPlay.fromJson(Map<String, dynamic> json) {
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
    variation = json['variation'];
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
    _data['variation'] = variation;
    return _data;
  }
}
