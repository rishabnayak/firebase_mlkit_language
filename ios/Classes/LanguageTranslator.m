#import "FirebaseMlkitLanguagePlugin.h"

@import FirebaseMLCommon;

@implementation LanguageTranslator


+ (void)handleEvent:(NSString *)text options:(NSDictionary *)options result:(FlutterResult)result {
    FIRTranslateLanguage out = FIRTranslateLanguageForLanguageCode(options[@"fromLanguage"]);
}

+ (FIRTranslatorOptions *)parseLanguageCode:(NSString *)languageCode {
    if ([languageCode isEqualToString: @"en"]) {
//        FIRTranslateLanguageForLanguageCode(languageCode)
        return nil;
    } else {
        return nil;
    }
//    FIRLanguageIdentificationOptions *options =
//    [[FIRLanguageIdentificationOptions alloc] initWithConfidenceThreshold: [conf floatValue]];
//    return options;
}

@end
