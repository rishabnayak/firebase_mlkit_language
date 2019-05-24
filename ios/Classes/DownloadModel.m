#import "FirebaseMlkitLanguagePlugin.h"

@import FirebaseMLCommon;

@implementation DownloadModel

+ (void)handleEvent:(NSString *)text result:(FlutterResult)result {
    FIRTranslateLanguage modelName = FIRTranslateLanguageForLanguageCode(text);
    FIRModelDownloadConditions *conditions =
    [[FIRModelDownloadConditions alloc] initWithAllowsCellularAccess:YES
                                         allowsBackgroundDownloading:YES];
    FIRTranslateRemoteModel *modelToDownload =
    [FIRTranslateRemoteModel translateRemoteModelForApp:FIRApp.defaultApp
                                               language:modelName
                                             conditions:conditions];
    NSProgress *dlProgress = [[FIRModelManager modelManager] downloadRemoteModel:modelToDownload];
    if (dlProgress.isFinished) {
        result(@"Downloaded");
    }
}
@end
