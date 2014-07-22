# XCTest+OHHTTPStubSuiteCleanUp

[![Version](http://cocoapod-badges.herokuapp.com/v/XCTest+OHHTTPStubSuiteCleanUp/badge.png)](http://cocoadocs.org/docsets/XCTest+OHHTTPStubSuiteCleanUp)
[![Platform](http://cocoapod-badges.herokuapp.com/p/XCTest+OHHTTPStubSuiteCleanUp/badge.png)](http://cocoadocs.org/docsets/XCTest+OHHTTPStubSuiteCleanUp)
[![Build Status](https://travis-ci.org/1aurabrown/XCTest-OHHTTPStubSuiteCleanUp.svg)](https://travis-ci.org/1aurabrown/XCTest-OHHTTPStubSuiteCleanUp)

## Usage

OHHTTPStubs does not automatically stop stubbing http requests at the end of tests. XCTest+OHHTTPStubSuiteCleanUp will tell OHHHTTPStubs to stop stubbing requests after each XCTest test method is run to avoid stubs from one test leaking into another test. There is no need to `#import` anything, XCTest+OHHTTPStubSuiteCleanUp cleans up stubs whenever XCTest's own `tearDown` method is called (after each test method).

This is useful for ensuring two test contexts don't mix, but a lot of the time what we want is that all stubs are remved at the end of each test. As we use Specta, XCTest+OHHTTPStubSuiteCleanUp will now also cleanup stubs after every `it` block.

```

SpecBegin(Example)

before(^{
  ... setup stubs
});

it(@"does something", ^{
  // check something
});

it(@"does something else", ^{
  // check something else
});

SpecEnd()

```

In the above example we would clean the stubs 3 times, after the `"does`something"` block is finished, after the `"does`something else"` block is finished and then finally at the `SpecEnd`. This is automatically turned on if you are using Specta in CocoaPods.

## Requirements
OHHTTPStubs

## Installation

XCTest+OHHTTPStubSuiteCleanUp is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "XCTest+OHHTTPStubSuiteCleanUp"

## Author

Laura Brown, laura@artsy.net

## License

XCTest+OHHTTPStubSuiteCleanUp is available under the MIT license. See the LICENSE file for more info.
