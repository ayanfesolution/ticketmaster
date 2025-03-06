import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TicketPurchasePage extends StatefulHookConsumerWidget {
  const TicketPurchasePage({super.key, required this.stringUrl});
  final String stringUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketPurchasePageState();
}

class _TicketPurchasePageState extends ConsumerState<TicketPurchasePage> {
  late final WebViewController _controller;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.stringUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (_progress < 1.0) // Show progress bar while loading
            LinearProgressIndicator(value: _progress),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
