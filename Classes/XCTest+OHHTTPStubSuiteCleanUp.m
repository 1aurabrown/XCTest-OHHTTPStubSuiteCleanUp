//
//  XCTest+OHHTTPStubSuiteCleanUp.m
//
//
//  Created by Laura Brown on 3/27/14.
//  Copyright (c) 2014 http://artsy.net. All rights reserved.
//

#import <objc/runtime.h>
#import <XCTest/XCTest.h>
#import <OHHTTPStubs/OHHTTPStubs.h>

@interface XCTest(OHHTTPAutoStub)
@end

@implementation XCTest(OHHTTPAutoStub)

+(void)load
{
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(tearDown));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_tearDown));
    method_exchangeImplementations(original, swizzled);
}

- (void)swizzled_tearDown
{
    [OHHTTPStubs removeAllStubs];
    [self swizzled_tearDown];
}

@end