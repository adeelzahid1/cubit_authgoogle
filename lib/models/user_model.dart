import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int points;
  final String rank;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.points,
    required this.rank,
  });


  factory User.fromDoc(DocumentSnapshot userDoc){
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      id: userDoc.id,
       name: userData!['name'],
        email: userData['email'],
         profileImage: userData['profileImage'],
          points: userData['points'],
           rank: userData['rank'],
        );
  }

    factory User.initialUser(){
    return User(
      id: '',
       name: '',
        email: '',
         profileImage: '',
          points: -1,
           rank: '',
        );
  }


  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      profileImage,
      points,
      rank,
    ];
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    int? points,
    String? rank,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      points: points ?? this.points,
      rank: rank ?? this.rank,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, profileImage: $profileImage, points: $points, rank: $rank)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'profileImage': profileImage});
    result.addAll({'points': points});
    result.addAll({'rank': rank});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'] ?? '',
      points: map['points']?.toInt() ?? 0,
      rank: map['rank'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
