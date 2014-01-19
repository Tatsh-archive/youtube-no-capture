#import "YTGuideSectionController.h"

// @todo Scan through the cells looking for the Capture cell and remove it (rather than assuming it is the last one)

@interface YTTweakVersionChecker : NSObject {
    NSArray *_supportedVersions;
}
@property (nonatomic, assign) NSArray *supportedVersions;
- (id)init;
- (BOOL)isSupportedVersion;
@end

@implementation YTTweakVersionChecker
@synthesize supportedVersions=_supportedVersions;

- (id)init {
    self.supportedVersions = [NSArray arrayWithObjects:
                                                       @"2.3.0.11210",
                                                       nil];
    return self;
}

- (BOOL)isSupportedVersion {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

    for (NSString *candidate in self.supportedVersions) {
        if ([candidate isEqualToString:version]) {
            return YES;
        }
    }

    return NO;
}
@end

%hook YTGuideSectionController
YTTweakVersionChecker *_gVersionChecker = [[YTTweakVersionChecker alloc] init];

// This appears to the be last method called when the view is initialised
- (void)setGuideSectionControllerDelegate:(id)fp8 {
    %orig;

    if (![_gVersionChecker isSupportedVersion]) {
        return;
    }

    int itemCount = [self numberOfItems];
    // 7 for iPad, 8 for iPhone
    if (itemCount == 7 || itemCount == 8) {
        [self deleteCellAtIndex:itemCount - 1];
    }
}
%end
