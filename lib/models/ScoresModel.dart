class ScoresModel {
  ScoresModel({
    required this.participants,
  });
  late final List<Participants> participants;

  ScoresModel.fromJson(Map<String, dynamic> json) {
    participants = List.from(json['participants'])
        .map((e) => Participants.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['participants'] = participants.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Participants {
  Participants({
    required this.userId,
    required this.userName,
    required this.userMail,
    required this.balance,
    required this.balanceInActions,
    required this.isWinner,
  });
  late final String userId;
  late final String userName;
  late final String userMail;
  late final int balance;
  late final int balanceInActions;
  late final bool isWinner;

  Participants.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userMail = json['user_mail'];
    balance = json['balance'];
    balanceInActions = json['balance_in_actions'];
    isWinner = json['is_winner'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['user_name'] = userName;
    _data['user_mail'] = userMail;
    _data['balance'] = balance;
    _data['balance_in_actions'] = balanceInActions;
    _data['is_winner'] = isWinner;
    return _data;
  }
}
