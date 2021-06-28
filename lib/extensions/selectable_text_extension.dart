part of google_translator;

extension TranslateSelectableText on SelectableText {
  /// Translate the text to the defined language using 
  /// the `google_translation` package using the `FutureBuilder` widget.
  /// 
  /// If the [placeholder] arguments is null then it will show three dots.
  Widget translate([String? placeholder]) {
    String? data = this.data;
    return FutureBuilder<String>(
      future: GoogleTranslatorController().translateText(data ?? ""),
      builder: (BuildContext context,
      AsyncSnapshot<String> snapshot) {
        String response = placeholder ?? "...";
        if (snapshot.hasData) {
          response = snapshot.data!;
        }
        return SelectableText(response,
          key: this.key,
          focusNode: this.focusNode,
          style: this.style,
          strutStyle: this.strutStyle,
          textAlign: this.textAlign,
          textDirection: this.textDirection,
          textScaleFactor: this.textScaleFactor,
          showCursor: this.showCursor,
          autofocus: this.autofocus,
          toolbarOptions: this.toolbarOptions,
          minLines: this.minLines,
          maxLines: this.maxLines,
          cursorWidth: this.cursorWidth,
          cursorHeight: this.cursorHeight,
          cursorRadius: this.cursorRadius,
          cursorColor: this.cursorColor,
          dragStartBehavior: this.dragStartBehavior,
          enableInteractiveSelection: this.enableInteractiveSelection,
          selectionControls: this.selectionControls,
          onTap: this.onTap,
          scrollPhysics: this.scrollPhysics,
          textHeightBehavior: this.textHeightBehavior,
          textWidthBasis: this.textWidthBasis,
          onSelectionChanged: this.onSelectionChanged,
        );
      }
    );
  }
}
