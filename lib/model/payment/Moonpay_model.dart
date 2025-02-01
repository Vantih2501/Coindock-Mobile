class MoonpayModel {
  final String status;
  final String message;
  final String paymentUrl;
  final String orderId;

  MoonpayModel({
    required this.status,
    required this.message,
    required this.paymentUrl,
    required this.orderId
  });

  factory MoonpayModel.fromJson(Map<String, dynamic> data) {
    return MoonpayModel(
      status: data['status'],
      message: data['message'],
      paymentUrl: data['data']['payment_url'] ?? '',
      orderId: data['order_id'] ?? '',
    );
  }
}