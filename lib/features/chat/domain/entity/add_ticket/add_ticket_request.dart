import 'package:json_annotation/json_annotation.dart';

part 'add_ticket_request.g.dart';

@JsonSerializable()
class AddTicketRequest {
  final String title;
  final String body;

  const AddTicketRequest({
    required this.title,
    required this.body,
  });

  factory AddTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$AddTicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddTicketRequestToJson(this);
}
