import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomHtmlViewer extends StatefulWidget {
  final String htmlContent;
  CustomHtmlViewer({Key? key, required this.htmlContent}) : super(key: key);

  @override
  _CustomHtmlViewerState createState() => _CustomHtmlViewerState();
}

class _CustomHtmlViewerState extends State<CustomHtmlViewer> {
  @override
  Widget build(BuildContext context) {
    return Html(
      style: {
        "body": Style(
          fontSize: FontSize(16.5),
          letterSpacing: 1,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          margin: EdgeInsets.zero,
          textAlign: TextAlign.left,
        ),
        "figure": Style(
          display: Display.INLINE,
        ),
        "p": Style(
          textAlign: TextAlign.left,
          padding: EdgeInsets.symmetric(vertical: 8),
        )
      },
      data: '''${widget.htmlContent}''',
    );
  }
}
