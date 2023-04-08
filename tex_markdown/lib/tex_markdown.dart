library tex_markdown;

import 'package:flutter/material.dart';

import 'md_widget.dart';

/// This widget create a full markdown widget as a column view.
class TexMarkdown extends StatelessWidget {
  const TexMarkdown(
    this.data, {
    super.key,
    this.style,
    this.followLinkColor = false,
    this.onLinkTab,
  });
  final String data;
  final TextStyle? style;
  final void Function(String url, String title)? onLinkTab;
  final bool followLinkColor;
  static String toHtml(String text) {
    String html = "";
    text.trim().split(RegExp(r"\n\n+")).forEach((element) {
      html += '<p>${MdWidget.toHtml(element)}</p>';
    });
    return html;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data
          .trim()
          .split(
            RegExp(r"\n\n+"),
          )
          .map<Widget>(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: MdWidget(
                e,
                style: style,
                followLinkColor: followLinkColor,
                onLinkTab: onLinkTab,
              ),
            ),
          )
          .toList(),
    );
  }
}
