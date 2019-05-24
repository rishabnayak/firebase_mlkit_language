part of firebase_mllanguage;

/// Used for viewing downloaded language models, deleting a downloaded language model, and downloading new language models.
///
///
/// A model manager is created via
/// `modelManager()` in [FirebaseLanguage]:
///
/// ```dart
///
/// final ModelManager modelManager =
///     FirebaseLanguage.instance.modelManager();
///
/// final List<String> = await modelManager.viewModels();
/// ```

class ModelManager {
  ModelManager._();

  /// Shows all locally available models.
  Future<List<String>> viewModels() async {
    final List<String> availableModels =
        await FirebaseLanguage.channel.invokeMethod('ModelManager#viewModels');
    return availableModels;
  }

  /// Deletes specified model.
  Future<String> deleteModel(String toDelete) async {
    final String status = await FirebaseLanguage.channel.invokeMethod(
        'ModelManager#deleteModel', <String, dynamic>{'model': toDelete});
    return status;
  }

  /// Downloads specified model
  Future<String> downloadModel(String toDownload) async {
    final String status = await FirebaseLanguage.channel.invokeMethod(
        'ModelManager#downloadModel', <String, dynamic>{'model': toDownload});
    return status;
  }
}
