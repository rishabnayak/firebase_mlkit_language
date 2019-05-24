#import "FirebaseMlkitLanguagePlugin.h"

@import FirebaseMLCommon;

@implementation LanguageTranslator


+ (void)handleEvent:(NSString *)text options:(NSDictionary *)options result:(FlutterResult)result {
    //    Get Proper Inputs for Translator
    FIRTranslateLanguage sourceLanguageString = FIRTranslateLanguageForLanguageCode(options[@"fromLanguage"]);
    FIRTranslateLanguage targetLanguageString = FIRTranslateLanguageForLanguageCode(options[@"toLanguage"]);
    
    //    Get Options
    FIRTranslatorOptions *translationOptions =
    [[FIRTranslatorOptions alloc] initWithSourceLanguage:sourceLanguageString
                                          targetLanguage:targetLanguageString];
    //    Intialize Translator
    FIRTranslator *customTranslator =
    [[FIRNaturalLanguage naturalLanguage] translatorWithOptions:translationOptions];
    
    //    Get Models On Device
    NSSet<FIRTranslateRemoteModel *> *localModels =
    [[FIRModelManager modelManager] availableTranslateModelsWithApp:FIRApp.defaultApp];
    
    Boolean isSourcePresent = [localModels containsObject:[FIRTranslateRemoteModel translateRemoteModelWithLanguage:sourceLanguageString]];
    
    Boolean isTargetPresent = [localModels containsObject:[FIRTranslateRemoteModel translateRemoteModelWithLanguage:targetLanguageString]];
    
    FIRModelDownloadConditions *conditions =
    [[FIRModelDownloadConditions alloc] initWithAllowsCellularAccess:YES
                                         allowsBackgroundDownloading:YES];
    
    if (isSourcePresent == false && isTargetPresent == false) {
        
        FIRTranslateRemoteModel *sourceModel =
        [FIRTranslateRemoteModel translateRemoteModelForApp:FIRApp.defaultApp
                                                   language:sourceLanguageString
                                                 conditions:conditions];
        FIRTranslateRemoteModel *targetModel =
        [FIRTranslateRemoteModel translateRemoteModelForApp:FIRApp.defaultApp
                                                   language:targetLanguageString
                                                 conditions:conditions];
        [[FIRModelManager modelManager] downloadRemoteModel:sourceModel];
        [[FIRModelManager modelManager] downloadRemoteModel:targetModel];
    };
    
    [customTranslator downloadModelIfNeededWithConditions:conditions
                                               completion:^(NSError *_Nullable error) {
                                                   if (error) {
                                                       [FLTFirebaseMlkitLanguagePlugin handleError:error result:result];
                                                       return;
                                                   }
                                                   [customTranslator translateText:text
                                                                        completion:^(NSString *_Nullable translatedText,
                                                                                     NSError *_Nullable error) {
                                                                            if (error != nil || translatedText == nil) {
                                                                                [FLTFirebaseMlkitLanguagePlugin handleError:error result:result];
                                                                                return;
                                                                            }
                                                                            result(translatedText);
                                                                        }];
                                               }];
}
@end
