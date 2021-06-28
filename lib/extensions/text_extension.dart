part of google_translator;

extension TranslateText on Text {
  /// Translate the text to the defined language using
  /// the `google_translation` package using the `FutureBuilder` widget.
  ///
  /// If the [placeholder] arguments is null then it will show three dots.
  Widget translate([String? placeholder]) {
    String? data = this.data;
    return FutureBuilder<String>(
        future: GoogleTranslatorController().translateText(data ?? ""),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          String response = placeholder ?? "...";
          if (snapshot.hasData) {
            response = snapshot.data!;
          }
          return Text(response,
              key: this.key,
              locale: this.locale,
              maxLines: this.maxLines,
              overflow: this.overflow,
              semanticsLabel: this.semanticsLabel,
              softWrap: this.softWrap,
              strutStyle: this.strutStyle,
              style: this.style,
              textAlign: this.textAlign,
              textDirection: this.textDirection,
              textHeightBehavior: this.textHeightBehavior,
              textScaleFactor: this.textScaleFactor,
              textWidthBasis: this.textWidthBasis);
        });
  }
}
