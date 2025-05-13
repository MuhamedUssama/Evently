class UserModel {
  static const String collectionName = 'users';

  String id;
  String email;
  String name;
  List<String> favourateEventsIds;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favourateEventsIds,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      favourateEventsIds: (json['favourateEventsIds'] as List).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'favourateEventsIds': favourateEventsIds,
    };
  }
}
