// ignore_for_file: file_names

class UserModel {
  UserModel({
    required this.token,
    this.plan,
    required this.permission,
    required this.name,
    required this.accounts,
    required this.accountId,
    required this.hasPassword,
    required this.onboarded,
  });
  late final String token;
  late final Null plan;
  late final String permission;
  late final String name;
  late final List<Accounts> accounts;
  late final String accountId;
  late final bool hasPassword;
  late final int onboarded;

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    plan = null;
    permission = json['permission'];
    name = json['name'];
    accounts =
        List.from(json['accounts']).map((e) => Accounts.fromJson(e)).toList();
    accountId = json['account_id'];
    hasPassword = json['has_password'];
    onboarded = json['onboarded'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['plan'] = plan;
    _data['permission'] = permission;
    _data['name'] = name;
    _data['accounts'] = accounts.map((e) => e.toJson()).toList();
    _data['account_id'] = accountId;
    _data['has_password'] = hasPassword;
    _data['onboarded'] = onboarded;
    return _data;
  }
}

class Accounts {
  Accounts({
    required this.id,
    required this.name,
    required this.permission,
  });
  late final String id;
  late final String name;
  late final String permission;

  Accounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['permission'] = permission;
    return _data;
  }
}
