import 'dart:convert';
import 'dart:developer';

import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:admin_app/core/service/api_service.dart';
import 'package:admin_app/core/utils/generate_hash.dart';
import 'package:dio/dio.dart';

class PaymentRepository {
  final ApiService apiService;

  final TokenManager tokenManager;
  PaymentRepository({
    required this.apiService,
    required this.tokenManager,
  });

  Future<void> initiatePaymentLink({
    required String key,
    required String txnid,
    required double amount,
    required String productinfo,
    required String firstname,
    required String phone,
    required String email,
    required String surl,
    required String furl,
    required String salt,
    //Maximum amount for the Payment Request when E-nach has integrated
    required int udf5,
    //Unique customer authentication id of auto debit authorization
    required String customerAuthenticationId,
//Pass the require payment values with comma separated like below show_payment_mode: NB,DC,UPI.

    required String showPaymentMode,
  }) async {
    String hash = generateHash(
      key: key,
      txnid: txnid,
      amount: amount,
      productinfo: productinfo,
      firstname: firstname,
      email: email,
      salt: salt,
    );

    print('Generated Hash: $hash');

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };

    var data = {
      'key': key,
      'txnid': txnid,
      'amount': amount.toString(),
      'productinfo': productinfo,
      'firstname': firstname,
      'phone': phone,
      'email': email,
      'surl': surl,
      'furl': furl,
      'hash': hash,
      'udf5': udf5.toString(),
      'customer_authentication_id': customerAuthenticationId,
      'show_payment_mode': showPaymentMode,
    };

    var dio = Dio();
    try {
      var response = await dio.request(
        'https://pay.easebuzz.in/payment/initiateLink',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        log(json.encode(response.data));
      } else {
        log(response.statusMessage.toString());
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
