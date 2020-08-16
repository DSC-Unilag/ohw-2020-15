import 'user.dart';

class Registration {
  String registeredAt;
  String type;
  int institutionId;
  int userId;
  User user;

  Registration(
      {this.registeredAt,
      this.type,
      this.institutionId,
      this.userId,
      this.user});

  Registration.fromJson(Map<String, dynamic> json) {
    registeredAt = json['registeredAt'];
    type = json['type'];
    institutionId = json['institutionId'];
    userId = json['userId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registeredAt'] = this.registeredAt;
    data['type'] = this.type;
    data['institutionId'] = this.institutionId;
    data['userId'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
