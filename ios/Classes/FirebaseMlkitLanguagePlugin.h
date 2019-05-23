#import <Flutter/Flutter.h>

#import "Firebase/Firebase.h"

@interface FLTFirebaseMlkitLanguagePlugin : NSObject<FlutterPlugin>
+ (void)handleError:(NSError *)error result:(FlutterResult)result;
@end

@protocol LangAgent
@required
+ (void)handleEvent:(NSString *)text
            options:(NSDictionary *)options
             result:(FlutterResult)result;
@optional
@end

@interface LanguageIdentifier : NSObject <LangAgent>
@end

@interface LanguageTranslator : NSObject <LangAgent>
@end
