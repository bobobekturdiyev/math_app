import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/auth/data/models/user.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  @JsonKey(name: 'order_id')
  final String orderId;
  final int amount;
  @JsonKey(name: 'user_id')
  final int userId;
  final String status;
  final String model;
  final User user;

  const OrderDto({
    required this.orderId,
    required this.amount,
    required this.userId,
    required this.status,
    required this.model,
    required this.user,
  });

  @override
  String toString() {
    return 'OrderDto(orderId: $orderId, amount: $amount, userId: $userId, status: $status, model: $model, user: $user)';
  }

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}
