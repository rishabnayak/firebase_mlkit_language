part of firebase_mllanguage;

/// Used for finding [TranslatedTextLabel]s in supplied text.
///
///
/// A language translator is created via
/// `languageTranslator([LanguageIdentifierOptions options])` in [FirebaseLanguage]:
///
/// ```dart
///
/// final LanguageTranslator languageTranslator =
///     FirebaseLanguage.instance.languageTranslator(options);
///
/// final List<TranslatedTextLabel> labels = await languageTranslator.processText("Sample Text");
/// ```

class LanguageTranslator {
  LanguageTranslator._(
      {@required LanguageCode fromLanguage, @required LanguageCode toLanguage})
      : _fromLanguage = fromLanguage,
      _toLanguage = toLanguage,
      assert(fromLanguage != null),
      assert(toLanguage != null);

      final LanguageCode _fromLanguage;
      final LanguageCode _toLanguage;

  /// Translates the input text.
  Future<List<TranslatedTextLabel>> processText(String text) async {
    final List<dynamic> reply = await FirebaseLanguage.channel
        .invokeMethod('LanguageTranslator#processText', <String, dynamic>{
      'options': <String, dynamic>{
        'fromLanguage': _fromLanguage,
        'toLanguage': _toLanguage
      },
      'text': text
    });

    final List<TranslatedTextLabel> labels = <TranslatedTextLabel>[];
    for (dynamic data in reply) {
      labels.add(TranslatedTextLabel._(data));
    }

    return labels;
  }
}

/// BCP-47 Language Codes accepted for [LanguageCode]
class LanguageCode {
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

/// Options for on device language labeler.
///
/// Confidence threshold could be provided for the language identification. For example,
/// if the confidence threshold is set to 0.7, only labels with
/// confidence >= 0.7 would be returned. The default threshold is 0.5.
class LanguageTranslatorOptions {
  /// Constructor for [LanguageIdentifierOptions].
  ///
  /// Confidence threshold could be provided for the language identification.
  /// For example, if the confidence threshold is set to 0.7, only labels with
  /// confidence >= 0.7 would be returned. The default threshold is 0.5.
  const LanguageTranslatorOptions({this.confidenceThreshold = 0.5})
      : assert(confidenceThreshold >= 0.0),
        assert(confidenceThreshold <= 1.0);

  /// The minimum confidence threshold of labels to be detected.
  ///
  /// Required to be in range [0.0, 1.0].
  final double confidenceThreshold;
}

/// Represents a language label detected by [LanguageIdentifier].
class TranslatedTextLabel {
  TranslatedTextLabel._(dynamic data)
      : confidence = data['confidence'],
        language = data['language'];

  /// The overall confidence of the result. Range [0.0, 1.0].
  final double confidence;

  /// A detected label from the given image.
  ///
  /// The label returned here is in English only.
  final String language;
}
