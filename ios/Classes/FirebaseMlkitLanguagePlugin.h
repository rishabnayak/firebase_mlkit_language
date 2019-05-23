#import <Flutter/Flutter.h>

#import "Firebase/Firebase.h"

@interface FLTFirebaseMlkitLanguagePlugin : NSObject<FlutterPlugin>
+ (void)handleError:(NSError *)error result:(FlutterResult)result;
@end
