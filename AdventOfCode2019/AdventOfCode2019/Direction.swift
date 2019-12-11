//
//  Direction.swift
//  AdventOfCode2019
//
//  Created by Daniele Formichelli on 11/12/2019.
//  Copyright © 2019 Daniele Formichelli. All rights reserved.
//

import Foundation

enum Direction: String {
  case up = "U"
  case right = "R"
  case down = "D"
  case left = "L"

  var dx: Int {
    switch self {
    case .up: return 0
    case .right: return 1
    case .down: return 0
    case .left: return -1
    }
  }

  var dy: Int {
    switch self {
    case .up: return 1
    case .right: return 0
    case .down: return -1
    case .left: return 0
    }
  }

  var turnLeft: Direction {
    switch self {
    case .up: return .left
    case .right: return .up
    case .down: return .right
    case .left: return .down
    }
  }

  var turnRight: Direction {
    switch self {
    case .up: return .right
    case .right: return .down
    case .down: return .left
    case .left: return .up
    }
  }
}