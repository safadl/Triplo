import 'package:flutter/material.dart';

class Flight {
  final int userId;
  final int id;
  final String title;

  Flight({
    this.userId,
    this.id,
    this.title,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
