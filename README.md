# Compatibility

This is not compatible with version 2.5.0 as Google removed the exact method I was hooking onto (`-[YTGuideSectionController setGuideSectionControllerDelegate]`).

```patch
diff --git a/YTGuideSectionController.h b/YTGuideSectionController.h
index 5e4dc35..6e8dac8 100644
--- a/YTGuideSectionController.h
+++ b/YTGuideSectionController.h
@@ -6,30 +6,43 @@
 
 #import "YTFeedSectionController.h"
 
-@class NSString;
+#import "YTInnerTubeController-Protocol.h"
 
-@interface YTGuideSectionController : YTFeedSectionController
+@class NSMutableDictionary, YTIFormattedString, YTSource;
+
+@interface YTGuideSectionController : YTFeedSectionController <YTInnerTubeController>
 {
     id <YTServices> _services;
     id <YTNavigation> _navigation;
-    NSString *_title;
-    id <YTGuideSectionControllerDelegate> _guideSectionControllerDelegate;
+    YTSource *_source;
+    YTIFormattedString *_title;
+    NSMutableDictionary *_collapsibleTriggerEntries;
+    id <YTResponder> _responderParent;
 }
 
 + (id)cellFactory;
-- (void)setGuideSectionControllerDelegate:(id)fp8;
-- (id)guideSectionControllerDelegate;
+- (void)setResponderParent:(id)fp8;
+- (id)responderParent;
 - (void).cxx_destruct;
-- (void)setGuideResponseItem:(id)fp8;
+- (id)navigationEndpointAtIndex:(int)fp8;
+- (id)collapsibleEntryForTriggerEntry:(id)fp8;
+- (void)removeTriggerEntry:(id)fp8;
+- (void)setTriggerEntry:(id)fp8 forCollapsibleEntry:(id)fp12;
+- (id)keyForTriggerEntry:(id)fp8;
+- (BOOL)handleExpandCollapseAtIndex:(int)fp8;
+- (void)setRenderer:(id)fp8;
+- (void)clearUnreadCountIfNeededForCell:(id)fp8 atIndex:(int)fp12;
 - (BOOL)persistCellSelection;
 - (void)didSelectItemAtIndex:(int)fp8 fromView:(id)fp12;
 - (float)heightForHeader;
 - (void)updateHeader:(id)fp8;
 - (Class)classForHeader;
 - (void)updateCell:(id)fp8 forEntry:(id)fp12;
-- (id)navigationEndpointAtIndex:(int)fp8;
-- (id)init;
-- (id)initWithGuideResponseItem:(id)fp8 services:(id)fp12 navigation:(id)fp16;
+- (BOOL)selectModelMatchingBlock:(id)fp(null);
+- (BOOL)scrollToModelMatchingBlock:(id)fp(null) animated:(void)fp8;
+- (void)loadWithModel:(id)fp8;
+- (id)initWithCellFactory:(id)fp8 imageService:(id)fp12;
+- (id)initWithServices:(id)fp8 navigation:(id)fp12 source:(id)fp16 parentResponder:(id)fp20;
 
 @end
 ```

# Build instructions

```bash
git clone git@github.com:Tatsh/youtube-no-capture.git
cd youtube-no-capture
ln -s "$THEOS" theos
make package install
```
