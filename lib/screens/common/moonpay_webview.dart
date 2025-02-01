import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MoonPayWebView extends StatefulWidget {
  const MoonPayWebView({super.key});

  @override
  State<MoonPayWebView> createState() => _MoonPayWebViewState();
}

class _MoonPayWebViewState extends State<MoonPayWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.moonpay.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}