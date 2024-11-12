import 'package:json_annotation/json_annotation.dart';


part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String name;
  final String surname;
  final String value;

  final String password;


  const RegisterRequest({
    required this.name,
    required this.surname,
    required this.value,
    required this.password,

  });

  @override
  String toString() {
    return 'RegisterRequest{  name: $name, surname:$surname,  email: $value,   password: $password,      }';
  }

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
