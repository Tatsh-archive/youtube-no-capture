#import "YTGuideSectionController.h"

// @todo Detect if YouTube version is supported and do nothing if it is not
// @todo Scan through the cells looking for the Capture cell and remove it (rather than assuming it is the last one)

%hook YTGuideSectionController
// This appears to the be last method called when the view is initialised
- (void)setGuideSectionControllerDelegate:(id)fp8 {
    %orig;
    int itemCount = [self numberOfItems];
    // 7 for iPad, 8 for iPhone
    if (itemCount == 7 || itemCount == 8) {
        [self deleteCellAtIndex:itemCount - 1];
    }
}
%end
