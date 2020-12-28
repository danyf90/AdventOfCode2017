//
//  Year2015Day14Tests.swift
//
//  Copyright © 2020 Bending Spoons. All rights reserved.
//

@testable import AdventOfCode2015
import XCTest

class Year2015Day14Tests: XCTestCase {
  func testPart1() {
    XCTAssertEqual(Year2015Day14().part1(Self.input).debugDescription, "2640")
  }

  func testPart2() {
    XCTAssertEqual(Year2015Day14().part2(Self.input).debugDescription, "1102")
  }

  static var input: String {
    """
    Dancer can fly 27 km/s for 5 seconds, but then must rest for 132 seconds.
    Cupid can fly 22 km/s for 2 seconds, but then must rest for 41 seconds.
    Rudolph can fly 11 km/s for 5 seconds, but then must rest for 48 seconds.
    Donner can fly 28 km/s for 5 seconds, but then must rest for 134 seconds.
    Dasher can fly 4 km/s for 16 seconds, but then must rest for 55 seconds.
    Blitzen can fly 14 km/s for 3 seconds, but then must rest for 38 seconds.
    Prancer can fly 3 km/s for 21 seconds, but then must rest for 40 seconds.
    Comet can fly 18 km/s for 6 seconds, but then must rest for 103 seconds.
    Vixen can fly 18 km/s for 5 seconds, but then must rest for 84 seconds.
    """
  }
}