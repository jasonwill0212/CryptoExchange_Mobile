import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatefulWidget {
  final String symbol; // BINANCE:BTCUSDT

  const WebviewWidget({super.key, required this.symbol});

  @override
  State<WebviewWidget> createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..loadHtmlString(_html(widget.symbol));
  }

  @override
  void didUpdateWidget(covariant WebviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.symbol != widget.symbol) {
      _controller.runJavaScript("updateChart('${widget.symbol}');");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(240),
      width: double.infinity,
      child: WebViewWidget(controller: _controller),
    );
  }

  String _html(String symbol) {
    return '''
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://s3.tradingview.com/tv.js"></script>

<style>
  html, body {
    margin: 0;
    padding: 0;
    background: #000;
    height: 100%;
    width: 100%;
  }
  #tv_chart {
    height: 100%;
    width: 100%;
  }
</style>
</head>

<body>
  <div id="tv_chart"></div>

<script>
let widget = null;

function createChart(symbol) {
  widget = new TradingView.widget({
    autosize: true,
    symbol: symbol,
    interval: "15",
    timezone: "Asia/Ho_Chi_Minh",
    theme: "dark",
    style: "1",
    locale: "en",
    hide_top_toolbar: false,
    hide_legend: false,
    save_image: false,
    container_id: "tv_chart"
  });
}

function updateChart(symbol) {
  document.getElementById("tv_chart").innerHTML = "";
  createChart(symbol);
}

// init
createChart("$symbol");
</script>
</body>
</html>
''';
  }
}
