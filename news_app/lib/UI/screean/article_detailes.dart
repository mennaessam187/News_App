import 'package:flutter/material.dart';
import 'package:news_app/utils/color_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetelswithnews extends StatefulWidget {
  final String url;
  //final String name;
  const ArticleDetelswithnews({super.key, required this.url});

  @override
  State<ArticleDetelswithnews> createState() => _ArticleDetelswithnewsState();
}

class _ArticleDetelswithnewsState extends State<ArticleDetelswithnews> {
  WebViewController controller = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.name),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            // color: Color(colorManager.bottomnavbarcolor),
          ),
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
