import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class WHtml extends StatelessWidget {
  final String htmlContent;
  final bool isScrollable;

  const WHtml({
    super.key,
    required this.htmlContent,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isScrollable) {
      return SingleChildScrollView(
        child: _htmlWidget(),
      );
    } else {
      return _htmlWidget();
    }
  }

  _htmlWidget() => HtmlWidget(
        htmlContent,
        customStylesBuilder: (element) {
          // Style for elements with the class 'foo'
          if (element.classes.contains('foo')) {
            return {
              'color': 'red',
              'font-weight': 'bold',
              'font-size': '16px',
              'text-decoration': 'underline',
            };
          }

          // Style for links (anchor tags)
          if (element.localName == 'a') {
            return {
              'color': 'blue',
              'text-decoration': 'none',
              'font-weight': 'normal',
            };
          }

          // Other styles for paragraphs, headings, etc.
          if (element.localName == 'p') {
            return {
              'font-size': '16px',
              'line-height': '1.6',
              'color': '#333',
              'margin': '10px 0',
            };
          }
          // (Add other custom styles here)

          return null;
        },

        // Callback for when a user taps a URL
        onTapUrl: (url) async {
          // Use url_launcher to open the URL
          if (!await launchUrl(Uri.parse(url))) {
            return false;
          }
          return true; // Return true to handle the URL tap
        },

        // Render mode for HTML body
        renderMode: RenderMode.column,

        // Default styling for text
        textStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'Bornia',
          color: Colors.black,
          letterSpacing: 0.5,
          height: 1.5,
        ),
      );
}
