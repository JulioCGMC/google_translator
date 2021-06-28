part of google_translator;

class GoogleTranslatorController {
  static late GoogleTranslatorController _instance;
  late Locale _deviceLocation;
  late String apiKey;
  late Locale _translateFrom;
  late bool? _automaticDetection;
  late Locale? _translateTo;
  late Duration _cacheDuration;

  final GoogleTranslatorRepository _translatorRepository 
    = GoogleTranslatorRepository();
  
  GoogleTranslatorController._();
  factory GoogleTranslatorController() {
    return _instance;
  }

  static void init(
    String apiKey, Locale translateFrom, {
    bool? automaticDetection,
    Locale? translateTo,
    required Duration cacheDuration
  }) {
    _instance = GoogleTranslatorController._()
      ..apiKey = apiKey
      .._translateFrom = translateFrom
      .._automaticDetection = automaticDetection
      .._cacheDuration = cacheDuration
      .._translateTo = translateTo;
    var window = WidgetsBinding.instance?.window ?? ui.window;
    _instance._deviceLocation = window.locale;
  }

  Locale get translateFrom => _translateFrom;

  Locale get translateTo {
    if (_translateTo != null) return _translateTo!;
    if (_automaticDetection == true) {
      return _deviceLocation;
    }
    return Locale("en");
  }

  Future<String> translateText(String text) async => _translatorRepository
  .translate(
    text: text,
    apiKey: apiKey, 
    source: translateFrom.toLanguageTag(),
    target: translateTo.toLanguageTag(),
    cacheDuration: _cacheDuration
  );
}
