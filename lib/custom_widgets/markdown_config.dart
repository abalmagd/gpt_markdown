import 'package:flutter/material.dart';

class GptMarkdownConfig {
  const GptMarkdownConfig({
    this.style,
    this.textDirection = TextDirection.ltr,
    this.onLinkTab,
    this.textAlign,
    this.textScaler,
    this.latexWorkaround,
    this.latexBuilder,
    this.followLinkColor = false,
    this.codeBuilder,
    this.sourceTagBuilder,
    this.highlightBuilder,
    this.linkBuilder,
    this.imageBuilder,
    this.maxLines,
    this.overflow,
  });
  final TextDirection textDirection;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextScaler? textScaler;
  final void Function(String url, String title)? onLinkTab;
  final String Function(String tex)? latexWorkaround;
  final Widget Function(
    BuildContext context,
    String tex,
    TextStyle textStyle,
    bool inline,
  )?
  latexBuilder;
  final Widget Function(
    BuildContext context,
    String content,
    TextStyle textStyle,
  )?
  sourceTagBuilder;
  final bool followLinkColor;
  final Widget Function(
    BuildContext context,
    String name,
    String code,
    bool closed,
  )?
  codeBuilder;
  final int? maxLines;
  final TextOverflow? overflow;
  final Widget Function(BuildContext context, String text, TextStyle style)?
  highlightBuilder;
  final Widget Function(
    BuildContext context,
    String text,
    String url,
    TextStyle style,
  )?
  linkBuilder;
  final Widget Function(BuildContext, String imageUrl)? imageBuilder;

  GptMarkdownConfig copyWith({
    TextStyle? style,
    TextDirection? textDirection,
    final void Function(String url, String title)? onLinkTab,
    final TextAlign? textAlign,
    final TextScaler? textScaler,
    final String Function(String tex)? latexWorkaround,
    final Widget Function(
      BuildContext context,
      String tex,
      TextStyle textStyle,
      bool inline,
    )?
    latexBuilder,
    final Widget Function(
      BuildContext context,
      String content,
      TextStyle textStyle,
    )?
    sourceTagBuilder,
    bool? followLinkColor,
    final Widget Function(
      BuildContext context,
      String name,
      String code,
      bool closed,
    )?
    codeBuilder,
    final int? maxLines,
    final TextOverflow? overflow,
    final Widget Function(BuildContext context, String text, TextStyle style)?
    highlightBuilder,
    final Widget Function(
      BuildContext context,
      String text,
      String url,
      TextStyle style,
    )?
    linkBuilder,
    final Widget Function(BuildContext, String imageUrl)? imageBuilder,
  }) {
    return GptMarkdownConfig(
      style: style ?? this.style,
      textDirection: textDirection ?? this.textDirection,
      onLinkTab: onLinkTab ?? this.onLinkTab,
      textAlign: textAlign ?? this.textAlign,
      textScaler: textScaler ?? this.textScaler,
      latexWorkaround: latexWorkaround ?? this.latexWorkaround,
      latexBuilder: latexBuilder ?? this.latexBuilder,
      followLinkColor: followLinkColor ?? this.followLinkColor,
      codeBuilder: codeBuilder ?? this.codeBuilder,
      sourceTagBuilder: sourceTagBuilder ?? this.sourceTagBuilder,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      highlightBuilder: highlightBuilder ?? this.highlightBuilder,
      linkBuilder: linkBuilder ?? this.linkBuilder,
      imageBuilder: imageBuilder ?? this.imageBuilder,
    );
  }

  Text getRich(InlineSpan span) {
    return Text.rich(
      span,
      textDirection: textDirection,
      textScaler: textScaler,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
