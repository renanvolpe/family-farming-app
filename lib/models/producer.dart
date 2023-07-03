// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class Producer {
  String id;
  String name;
  String email;
  bool visible_producer;
  String short_description;
  Producer({
    required this.id,
    required this.name,
    required this.email,
    required this.visible_producer,
    required this.short_description,
  });

  Producer copyWith({
    String? id,
    String? name,
    String? email,
    bool? visible_producer,
    String? short_description,
  }) {
    return Producer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      visible_producer: visible_producer ?? this.visible_producer,
      short_description: short_description ?? this.short_description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'visible_producer': visible_producer,
      'short_description': short_description,
    };
  }

  factory Producer.fromMap(Map<String, dynamic> map) {
    return Producer(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      visible_producer: map['visible_producer'] as bool,
      short_description: map['short_description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Producer.fromJson(String source) => Producer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Producer(id: $id, name: $name, email: $email, visible_producer: $visible_producer, short_description: $short_description)';
  }

  @override
  bool operator ==(covariant Producer other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.visible_producer == visible_producer &&
      other.short_description == short_description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      visible_producer.hashCode ^
      short_description.hashCode;
  }
}


