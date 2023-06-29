// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? id;
  String name;
  String email;
  String lastName;
  String password;
  User(
    this.id,
    this.name,
    this.email,
    this.lastName,
    this.password,
  );

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? lastName,
    String? password,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      lastName ?? this.lastName,
      password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'lastName': lastName,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'] != null ? map['id'] as String : null,
      map['name'] as String,
      map['email'] as String,
      map['lastName'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, lastName: $lastName, password: $password)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.lastName == lastName &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      lastName.hashCode ^
      password.hashCode;
  }
}
