import 'package:equatable/equatable.dart';

class RouletteOption extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final Map<String, dynamic>? metadata;

  const RouletteOption({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.metadata,
  });

  factory RouletteOption.fromJson(Map<String, dynamic> json) {
    return RouletteOption(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'metadata': metadata,
    };
  }

  @override
  List<Object?> get props => [id, title, description, category, metadata];
} 