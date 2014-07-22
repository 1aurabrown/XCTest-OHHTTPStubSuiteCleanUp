//
//  SpectaStubbingSpec.m
//  UnitTests
//
//  Created by Orta on 22/07/2014.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import <Specta/Specta.h>
#import <OHHTTPStubs/OHHTTPStubs.h>

SpecBegin(SpectStubbing)

    it(@"starts with one", ^{
        XCTAssertTrue([OHHTTPStubs allStubs].count == 0, @"Initial number of stubs should be zero.");
NSLog(@"%@", @([OHHTTPStubs allStubs].count));
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            return YES;
        } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
            return [OHHTTPStubsResponse responseWithData:nil statusCode:400 headers:nil];
        }];

        XCTAssertTrue([OHHTTPStubs allStubs].count == 1, @"There should be one stubbed request.");
NSLog(@"%@", @([OHHTTPStubs allStubs].count));
    });

   it(@"ends with zero", ^{
       NSLog(@"%@", @([OHHTTPStubs allStubs].count));

        XCTAssertTrue([OHHTTPStubs allStubs].count == 0, @"Teardown should remove all stubs.");
    });

SpecEnd
