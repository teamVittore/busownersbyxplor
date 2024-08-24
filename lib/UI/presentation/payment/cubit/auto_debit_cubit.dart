import 'package:admin_app/UI/presentation/payment/repository/payment_repository.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_debit_cubit.freezed.dart';
part 'auto_debit_state.dart';

class AutoDebitCubit extends Cubit<AutoDebitState> {
  final PaymentRepository paymentRepository = locator<PaymentRepository>();
  AutoDebitCubit() : super(const AutoDebitState.initial());
  initatePayment() {
    paymentRepository.initiatePaymentLink(
      key: "IPQP7IH02B",
      txnid: "Hashiq_1",
      amount: 1.00,
      productinfo: "vehicle",
      firstname: "Hashiq",
      phone: "7559963134",
      email: "hashiqdeveloper@gmail.com",
      surl: "http://localhost:3000/response",
      furl: "http://localhost:3000/response",
      salt: "OLEIY6286H",
      udf5: 10,
      customerAuthenticationId: "1",
      showPaymentMode: "NB,DC,UPI",
    );
  }
}
