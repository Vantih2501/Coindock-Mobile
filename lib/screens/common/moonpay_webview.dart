import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MoonPayWebView extends StatefulWidget {
  final String coin;
  const MoonPayWebView({super.key, required this.coin});

  @override
  State<MoonPayWebView> createState() => _MoonPayWebViewState();
}

class _MoonPayWebViewState extends State<MoonPayWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    debugPrint('coint: ${widget.coin}');
    _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.binance.com/en/crypto/buy/USD/${widget.coin}?channel=calculator&from=ocbs'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff181A20),
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(LucideIcons.arrowLeft, color: Colors.white)
        ),
        title: Text(
          'Payment',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}