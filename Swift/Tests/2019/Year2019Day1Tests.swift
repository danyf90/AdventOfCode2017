//
//  Year2019Day1Tests.swift
//  Tests
//
//  Created by Daniele Formichelli on 01/12/2019.
//  Copyright © 2019 Daniele Formichelli. All rights reserved.
//

@testable import AdventOfCode2019
import XCTest

class Year2019Day1Tests: XCTestCase {
  func testPart1() {
    XCTAssertEqual(Year2019Day1().part1(Self.input).debugDescription, "3323874")
  }

  func testPart2() {
    XCTAssertEqual(Year2019Day1().part2(Self.input).debugDescription, "4982961")
  }

  static var input: String {
    """
    113373
    132031
    104150
    65914
    81792
    148723
    94982
    117511
    89533
    114335
    128953
    53970
    52522
    146264
    89614
    90375
    114054
    110582
    91958
    64811
    58692
    138427
    81558
    132987
    138904
    75785
    99259
    113640
    84250
    83134
    80260
    116018
    76186
    81457
    107235
    108657
    98110
    69048
    63806
    57223
    65387
    73452
    80704
    55250
    116562
    120546
    145999
    146063
    100858
    90460
    72073
    126926
    131708
    131592
    104792
    91527
    128114
    139831
    99430
    97397
    129211
    102181
    118278
    97812
    119580
    100912
    66865
    99460
    128493
    76092
    139993
    57749
    83111
    127747
    101243
    100619
    79018
    81946
    146650
    142257
    139882
    52795
    76248
    62824
    137418
    60898
    108234
    55589
    132193
    51191
    56727
    84285
    131930
    123750
    62959
    120799
    86276
    111156
    124185
    105008
    """
  }
}
