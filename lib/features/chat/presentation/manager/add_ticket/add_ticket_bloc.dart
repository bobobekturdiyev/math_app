import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart';
import 'package:math_app/features/chat/domain/entity/add_ticket/add_ticket_request.dart';
import 'package:math_app/features/chat/domain/repositories/ticket_repo.dart';

part 'add_ticket_event.dart';
part 'add_ticket_state.dart';

class AddTicketBloc extends Bloc<AddTicketEvent, AddTicketState> {
  TicketRepo ticketRepo = locator<TicketRepo>();

  AddTicketBloc() : super(AddTicketInitial()) {
    on<SendTicketEvent>((event, emit) async {
      emit(AddTicketLoading());

      final Map<String, String?> ticket = {
        'title': null,
        'body': null,
      };
      bool hasError = false;

      if (event.title == "") {
        hasError = true;
        ticket['title'] = "Sarlavha bo'sh bo'lishi mumkin emas";
      }

      if (event.body == "") {
        hasError = true;
        ticket['body'] = "Sarlavha mazmuni bo'sh bo'lishi mumkin emas";
      }

      if (hasError) {
        emit(AddTicketInitial(errorData: ticket));
      } else {
        final result = await ticketRepo.addTicket(
          addTicketRequest:
              AddTicketRequest(title: event.title, body: event.body),
        );

        if (result is DataSuccess && result.data != null) {
          emit(AddTicketSuccess(ticketDto: result.data!));
        } else {
          emit(AddTicketError(
              message: result.errorMessage ?? "Savol qo'shishdagi xatolik"));
        }
      }
    });
  }
}
