part of firebase_mllanguage;

/// Used for finding [TranslatedTextLabel]s in supplied text.
///
///
/// A language translator is created via
/// `languageTranslator(fromLanguage: SupportedLanguages.lang, toLanguage: SupportedLanguages.lang)` in [FirebaseLanguage]:
///
/// ```dart
///
/// final LanguageTranslator languageTranslator =
///     FirebaseLanguage.instance.languageTranslator(fromLanguage: SupportedLanguages.lang, toLanguage: SupportedLanguages.lang);
///
/// final List<TranslatedTextLabel> labels = await languageTranslator.processText("Sample Text");
/// ```

class LanguageTranslator {
  LanguageTranslator._(
      {@required String fromLanguage, @required String toLanguage})
      : _fromLanguage = fromLanguage,
        _toLanguage = toLanguage,
        assert(fromLanguage != null),
        assert(toLanguage != null);

  final String _fromLanguage;
  final String _toLanguage;

  /// Translates the input text.
  Future<String> processText(String text) async {
    final String reply = await FirebaseLanguage.channel
        .invokeMethod('LanguageTranslator#processText', <String, dynamic>{
      'options': <String, dynamic>{
        'fromLanguage': _fromLanguage,
        'toLanguage': _toLanguage
      },
      'text': text
    });

    return reply;
  }
}

/// Conversion for [SupportedLanguages] to BCP-47 language codes
class SupportedLanguages {
  static const Afrikaans = 'af';
  static const Arabic = 'ar';
  static const Belarusian = 'be';
  static const Bulgarian = 'bg';
  static const Bengali = 'bn';
  static const Catalan = 'ca';
  static const Czech = 'cs';
  static const Welsh = 'cy';
  static const Danish = 'da';
  static const German = 'de';
  static const Greek = 'el';
  static const English = 'en';
  static const Esperanto = 'eo';
  static const Spanish = 'es';
  static const Estonian = 'et';
  static const Persian = 'fa';
  static const Finnish = 'fi';
  static const French = 'fr';
  static const Irish = 'ga';
  static const Galician = 'gl';
  static const Gujarati = 'gu';
  static const Hebrew = 'he';
  static const Hindi = 'hi';
  static const Croatian = 'hr';
  static const Haitian = 'ht';
  static const Hungarian = 'hu';
  static const Indonesian = 'id';
  static const Icelandic = 'is';
  static const Italian = 'it';
  static const Japanese = 'ja';
  static const Georgian = 'ka';
  static const Kannada = 'kn';
  static const Korean = 'ko';
  static const Lithuanian = 'lt';
  static const Latvian = 'lv';
  static const Macedonian = 'mk';
  static const Marathi = 'mr';
  static const Malay = 'ms';
  static const Maltese = 'mt';
  static const Dutch = 'nl';
  static const Norwegian = 'no';
  static const Polish = 'pl';
  static const Portuguese = 'pt';
  static const Romanian = 'ro';
  static const Russian = 'ru';
  static const Slovak = 'sk';
  static const Slovenian = 'sl';
  static const Albanian = 'sq';
  static const Swedish = 'sv';
  static const Swahili = 'sw';
  static const Tamil = 'ta';
  static const Telugu = 'te';
  static const Thai = 'th';
  static const Tagalog = 'tl';
  static const Turkish = 'tr';
  static const Ukranian = 'uk';
  static const Urdu = 'ur';
  static const Vietnamese = 'vi';
  static const Chinese = 'zh';
}
