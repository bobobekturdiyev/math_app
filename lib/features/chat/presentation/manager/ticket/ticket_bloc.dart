import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart';
import 'package:math_app/features/chat/domain/repositories/ticket_repo.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketRepo ticketRepo = locator<TicketRepo>();

  TicketBloc() : super(TicketInitial()) {
    on<LoadTickets>((event, emit) async {
      emit(TicketLoading());
      final result = await ticketRepo.getTickets();

      if (result is DataSuccess) {
        emit(TicketLoaded(tickets: result.data ?? []));
      } else {
        emit(TicketError(
            message: result.errorMessage ?? "Savollarni yuklashda xatolik"));
      }
    });

    add(LoadTickets());
  }
}
