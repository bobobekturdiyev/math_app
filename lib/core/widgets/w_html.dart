import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
          if (element.classes.contains('foo')) {
            return {'color': 'red'};
          }

          return null;
        },
        // this callback will be triggered when user taps a link
        onTapUrl: (url) => true,

        // select the render mode for HTML body
        // by default, a simple `Column` is rendered
        // consider using `ListView` or `SliverList` for better performance
        renderMode: RenderMode.column,

        // set the default styling for text
        textStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'Bornia',
        ),
      );
}
