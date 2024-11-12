
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/features/profile/domain/entity/card_req/card_data/card_data.dart';
import 'package:math_app/features/profile/domain/entity/card_req/card_pay_req.dart';
import 'package:math_app/features/profile/domain/entity/card_req/card_request.dart';
import 'package:math_app/features/profile/domain/entity/code_req/code_params.dart';
import 'package:math_app/features/profile/domain/entity/code_req/code_req.dart';
import 'package:math_app/features/profile/domain/entity/pay_request/pay_request.dart';
import 'package:math_app/features/profile/domain/entity/token_req/params.dart';
import 'package:math_app/features/profile/domain/entity/token_req/token_req.dart';

import '../../../../../core/util/validator.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'payme_event.dart';
part 'payme_state.dart';

class PaymeBloc extends Bloc<PaymeEvent, PaymeState> {
  final ProfileRepo profileRepo;
   String token='';
  PaymeBloc({required this.profileRepo}) : super(const PaymeInitial()) {

    on<PayBalance>((event, emit) async{
        emit(const PaymeInitial(status: StateStatus.loading));
      final result=await profileRepo.payFromBalance(payRequest: PayRequest(planId: event.id));
      if(result is DataSuccess&&result.data?.code==200){
        emit(PaySuccess());
      }else{
        emit( PaymeInitial(status: StateStatus.error,errorPay: result.data?.message ));

      }
    });
    on<CardVerification>((event, emit) async{
      final Map<String, String?> errors = {
        'card': null,
        'expire': null,
      };
      bool hasError=false;
      if (!Validator.validateCardNumber(event.cardNumber)) {
        hasError = true;
        errors['card'] = "Karta raqamin to'g'ri kiriting";
      } if (!Validator.validateExpiryDate(event.expire)) {
        hasError = true;
        errors['expire'] = "Amal qilish muddatini to'g'ri kiriting";
      }
      if(hasError){
        print("error ishladi");
        emit(PaymeInitial(status: StateStatus.error,errorData: errors));
      }else{

        emit(const PaymeInitial(status: StateStatus.loading));
        final result = await profileRepo.payFromCard(
            cardPayReq: CardPayReq(
                method: 'cards.create',
                params: CardRequest(
                    card: CardData(number: event.cardNumber, expire: event.expire),
                    save: true)));

        if(result is DataSuccess&& result.data?.result!=null){
          add(SendToken(token: result.data!.result!.card.token));
        }else{
          emit(PaymeInitial(status: StateStatus.error, error: result.data?.error?.message));
        }
      }



    });
    on<SendToken>((event, emit) async{
      final result=await profileRepo.tokenVerify(tokenReq:  TokenReq(params: Params(token: event.token)));
      if(result is DataSuccess){
        token=event.token;

        emit(const CardVerifyCode());
      }else{
        emit(const PaymeInitial(status: StateStatus.error, ));

      }
    });
    on<VerifyCode>((event, emit) async {
      emit(const CardVerifyCode(
        status: StateStatus.loading,
      ));
      final result = await profileRepo.codeVerify(
          codeReq: CodeReq(params: CodeParams(token: token, code: event.code)));
      if (result is DataSuccess && result.data?.result != null) {
        emit(PaySuccess());
      } else {
        emit(CardVerifyCode(
            status: StateStatus.error, error: result.data?.error?.message));
      }
    });
  }
}
