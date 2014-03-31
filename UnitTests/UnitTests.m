//
//  UnitTests.m
//  UnitTests
//
//  Created by Laura Brown on 03/31/2014.
//
//

#import <XCTest/XCTest.h>
#import <OHHTTPStubs/OHHTTPStubs.h>

@interface UnitTests : XCTestCase
@end

@implementation UnitTests

- (void)testTeardownRemovesHTTPStubs
{
    XCTAssertTrue([OHHTTPStubs allStubs].count == 0, @"Initial number of stubs should be zero.");

    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithData:nil statusCode:400 headers:nil];
    }];

    XCTAssertTrue([OHHTTPStubs allStubs].count == 1, @"There should be one stubbed request.");

    [self tearDown];

    XCTAssertTrue([OHHTTPStubs allStubs].count == 0, @"Teardown should remove all stubs.");
}

@end
