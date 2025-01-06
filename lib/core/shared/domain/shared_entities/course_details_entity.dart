
import 'package:math_app/core/shared/domain/shared_entities/module_entity.dart';

class CourseDetailsEntity {
  final int id;
  final String name;
  final String author;
  final String slug;
  final bool isSold;
  final double price;
  final String description;
  final List<ModuleEntity> modules;
  final double discountPrice;

  CourseDetailsEntity({
    required this.id,
    required this.name,
    required this.author,
    required this.slug,
    required this.isSold,
    required this.modules,
    required this.price,
    required this.description,
    required this.discountPrice,
  });
}
