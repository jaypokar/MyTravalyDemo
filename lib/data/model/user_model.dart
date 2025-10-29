import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String username;
  final String? photoUrl;

  const UserModel({
    required this.id,
    required this.email,
    required this.username,
    this.photoUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['uid'] ?? map['id'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'id': id,
      'email': email,
      'username': username,
      'photoUrl': photoUrl,
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? username,
    String? photoUrl,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [id, email, username, photoUrl];
}
