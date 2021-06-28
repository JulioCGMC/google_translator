part of google_translator;

class GoogleTranslatorInit extends StatelessWidget {
  /// The GCP key to index the translation to the GCP billing account and to validate the api call.
  final String apiKey;
  /// The ancestor of all the text to translate.
  final Widget Function() builder;
  /// The duration of the Translate Api cache
  final Duration cacheDuration;
  /// Turn this `true` in case you don't know the `target` device language.
  final bool? automaticDetection;
  /// The original text [source] language.
  final Locale translateFrom;
  /// The language in which the text should appear
  final Locale? translateTo;

  const GoogleTranslatorInit(this.apiKey, {
    required this.builder,
    required this.translateFrom,
    this.automaticDetection, 
    this.translateTo,
    this.cacheDuration = const Duration(days: 7)
  }) : assert(automaticDetection == true || translateTo != null, 
      'Please select a language to translate'), 
    assert(translateTo != null, 
      'Please select the original language to translate');

  @override
  Widget build(BuildContext context) {
    GoogleTranslatorController.init(apiKey, translateFrom,
      translateTo: translateTo, automaticDetection: automaticDetection,
      cacheDuration: cacheDuration
    );
    return builder();
  }
}
