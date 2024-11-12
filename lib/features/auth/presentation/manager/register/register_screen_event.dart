part of 'register_screen_bloc.dart';

abstract class RegisterScreenEvent extends Equatable {
  const RegisterScreenEvent();
}

class Back extends RegisterScreenEvent {
  const Back();

  @override
  List<Object?> get props => [];
}

// class NextStep extends RegisterScreenEvent {
//   final String firstName;
//   final String lastName;
//   final String phoneNumber;
//
//   const NextStep({
//     required this.firstName,
//     required this.lastName,
//     required this.phoneNumber,
//   });
//
//   @override
//   List<Object?> get props => [
//         firstName,
//         lastName,
//         phoneNumber,
//       ];
// }

class ConfirmEvent extends RegisterScreenEvent {
  final String name;
  final String surname;
  final String value;
  final String password;
  // final String confirmPassword;

  const ConfirmEvent({
    required this.name,
    required this.surname,
    required this.value,
    required this.password,
    // required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
        name,
        surname,
        value,
        password,
        // confirmPassword,
      ];
}

class ResendCode extends RegisterScreenEvent {
  @override
  List<Object?> get props => [];
}

class VerifyCode extends RegisterScreenEvent {
  final String code;

  const VerifyCode({required this.code});

  @override
  List<Object?> get props => [code];
}
