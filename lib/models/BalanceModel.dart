class BalanceModel {
  BalanceModel({
    required this.userId,
    required this.balanceUser,
  });
  late final String userId;
  late final String balanceUser;

  BalanceModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    balanceUser = json['balance_user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['balance_user'] = balanceUser;
    return _data;
  }
}
