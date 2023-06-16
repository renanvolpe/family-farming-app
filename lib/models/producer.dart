// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Producer {
  String id;
  String name;
  String email;
  String latitude;
  String longitude;
  String description;
  String companyName;
  Producer({
    required this.id,
    required this.name,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.companyName,
  });

  Producer copyWith({
    String? id,
    String? name,
    String? email,
    String? latitude,
    String? longitude,
    String? description,
    String? companyName,
  }) {
    return Producer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
      companyName: companyName ?? this.companyName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'companyName': companyName,
    };
  }

  factory Producer.fromMap(Map<String, dynamic> map) {
    return Producer(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
      description: map['description'] as String,
      companyName: map['companyName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Producer.fromJson(String source) => Producer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Producer(id: $id, name: $name, email: $email, latitude: $latitude, longitude: $longitude, description: $description, companyName: $companyName)';
  }

  @override
  bool operator ==(covariant Producer other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.description == description &&
      other.companyName == companyName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      description.hashCode ^
      companyName.hashCode;
  }
}


