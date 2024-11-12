//
//
// /// Mapper folder date va domainni malumotlarini aylantirish uchun kerka
// /// ikkalasi orasida malumotlarni bir shaklan boshqa shaklga oladi
//
// class AuthMapper extends Mapper {
//   RegisterEntities registerToEntityList(RegisterDto dto) {
//     String messages;
//     messages = dto.message;
//
//     return RegisterEntities(message: messages, success: dto.success);
//   }
//
//   RegisterCodeEntities registerCodeToEntity(RegisterCodeDto dto) {
//     String message;
//     message = dto.message;
//     return RegisterCodeEntities(message: message, success: dto.success);
//   }
//
//   LoginEntities loginToEntities(LoginDataResponseDto dto) {
//     LoginEntities login;
//     if (dto.success) {
//       login = LoginEntities(
//           token: dto.data!.authorization.token,
//           name: dto.data!.name,
//           surName: dto.data!.surname,
//           success: dto.success,
//           message: dto.message);
//       return login;
//     } else {
//       return LoginEntities(
//         name: null,
//         surName: null,
//         token: null,
//         success: dto.success,
//         message: dto.message,
//       );
//     }
//   }
// }
