import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GiveAwayDetailweb extends StatelessWidget {
  const GiveAwayDetailweb({Key? key, required this.giveAwayUrl})
      : super(key: key);
  final String giveAwayUrl;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 1, 41),
        body: Column(
          children: [
            Container(
              height: height - 25,
              width: width,
              child: WebView(
                initialUrl: giveAwayUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
