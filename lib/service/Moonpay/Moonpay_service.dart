import 'dart:convert';

import 'package:coindock_app/model/payment/Moonpay_model.dart';
import 'package:coindock_app/service/dio_client_service/_dio_client.dart';

class PaymoonService {
  final dio = DioClient().dioMoonpayApi;

  Future<MoonpayModel> createPayment({ required String coinType, required double amount, required String userEmail }) async {
    try {
      final response = await dio.post('/create-payment', 
        data: jsonEncode({
          'coin_type': coinType,
          'amount': amount,
          'customer_email': userEmail,
          // 'callback_url': 'https://yourapp.com/callback',
          // 'redirect_url': 'yourapp://payment-complete',
        })
      );

      if (response.statusCode == 200) {
        return MoonpayModel.fromJson(jsonDecode(response.data));
      } else {
        throw Exception('Failed to create payment');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}