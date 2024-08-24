part of 'auto_debit_cubit.dart';

@freezed
class AutoDebitState with _$AutoDebitState {
  const factory AutoDebitState.autherizationFail() = _AutherizationFail;
  const factory AutoDebitState.autherizationSuccess() = _AutherizationSuccess;
  const factory AutoDebitState.initial() = _Initial;
  const factory AutoDebitState.loading() = _Loading;
}
