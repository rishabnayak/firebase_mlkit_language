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
  // Afrikaans
  static const Arabic = 'ar',
  // Arabic
  be,
  // Belarusian
  bg,
  // Bulgarian
  bn,
  // Bengali
  ca,
  // Catalan
  cs,
  // Czech
  cy,
  // Welsh
  da,
  // Danish
  de,
  // German
  el,
  // Greek
  en,
  // English
  eo,
  // Esperanto
  es,
  // Spanish
  et,
  // Estonian
  fa,
  // Persian
  fi,
  // Finnish
  fr,
  // French
  ga,
  // Irish
  gl,
  // Galician
  gu,
  // Gujarati
  he,
  // Hebrew
  hi,
  // Hindi
  hr,
  // Croatian
  ht,
  // Haitian
  hu,
  // Hungarian
  id,
  // Indonesian
  is,
  // Icelandic
  it,
  // Italian
  ja,
  // Japanese
  ka,
  // Georgian
  kn,
  // Kannada
  ko,
  // Korean
  lt,
  // Lithuanian
  lv,
  // Latvian
  mk,
  // Macedonian
  mr,
  // Marathi
  ms,
  // Malay
  mt,
  // Maltese
  nl,
  // Dutch
  no,
  // Norwegian
  pl,
  // Polish
  pt,
  // Portuguese
  ro,
  // Romanian
  ru,
  // Russian
  sk,
  // Slovak
  sl,
  // Slovenian
  sq,
  // Albanian
  sv,
  // Swedish
  sw,
  // Swahili
  ta,
  // Tamil
  te,
  // Telugu
  th,
  // Thai
  tl,
  // Tagalog
  tr,
  // Turkish
  uk,
  // Ukranian
  ur,
  // Urdu
  vi,
  // Vietnamese
  zh,
  // Chinese
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
