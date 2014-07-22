//
// SPTExampleGroup(OHHTTPSpectaItCleanup)
// Artsy
//
//  Created by orta on 22/07/14.
//  Copyright (c) 2014 http://artsy.net. All rights reserved.
//

#ifdef COCOAPODS_POD_AVAILABLE_Specta

#import <objc/runtime.h>
#import <XCTest/XCTest.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <Specta/Specta.h>

@interface SPTExampleGroup (OHHTTPSpectaItCleanup)
- (void)runAfterHooks:(NSString *)compiledName;
@end

@implementation SPTExampleGroup (OHHTTPSpectaItCleanup)

+ (void)load
{
    Method original, swizzled;

    original = class_getInstanceMethod(self, @selector(runAfterHooks:));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_runAfterHooks:));
    if (original) {
        method_exchangeImplementations(original, swizzled);
    }
}

- (void)swizzled_runAfterHooks:(NSArray *)array
{
    [self swizzled_runAfterHooks:array];
    [OHHTTPStubs removeAllStubs];
}
@end

#endif
