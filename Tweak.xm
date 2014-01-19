#import "YTGuideSectionController.h"

%hook YTGuideSectionController
// This appears to the be last method called when the view is initialised
- (void)setGuideSectionControllerDelegate:(id)fp8 {
    %log;
    %orig;
    if ([self numberOfItems] == 7) {
        [self deleteCellAtIndex:6];
    }
}
%end
