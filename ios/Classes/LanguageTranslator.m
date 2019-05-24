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
    
    //    Create Conditions
    FIRModelDownloadConditions *conditions =
    [[FIRModelDownloadConditions alloc] initWithAllowsCellularAccess:YES
                                         allowsBackgroundDownloading:YES];
    
    [customTranslator downloadModelIfNeededWithConditions:conditions
                                               completion:^(NSError *_Nullable error) {
                                                   if (error) {
                                                       [FLTFirebaseMlkitLanguagePlugin handleError:error result:result];
                                                       return;
                                                   }
                                                   
                                               }];
    //   Send Example Translation
    [customTranslator translateText:text
                         completion:^(NSString *_Nullable translatedText,
                                      NSError *_Nullable error) {
                             if (error != nil || translatedText == nil) {
                                 return;
                             }
                             
                             result(translatedText);
                         }];
    
    
    
}
@end
