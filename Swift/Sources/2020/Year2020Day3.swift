//
//  Year2020Day3.swift
//  AdventOfCode2020
//
//  Created by Daniele Formichelli on 03/12/20.
//  Copyright © 2020 Daniele Formichelli. All rights reserved.
//

import Utils

/// https://adventofcode.com/2020/day/3
struct Year2020Day3: DayBase {
  func part1(_ input: String) -> CustomDebugStringConvertible {
    self.trees(for: .init(x: 3, y: 1), in: input.asMap)
  }

  func part2(_ input: String) -> CustomDebugStringConvertible {
    let slopes: [Point] = [
      .init(x: 1, y: 1),
      .init(x: 3, y: 1),
      .init(x: 5, y: 1),
      .init(x: 7, y: 1),
      .init(x: 1, y: 2),
    ]

    return slopes.map { self.trees(for: $0, in: input.asMap) }.reduce(1) { $0 * $1 }
  }

  fileprivate func trees(for slope: Point, in map: Map) -> Int {
    var position = Point(x: 0, y: 0)
    var treesCount = 0
    while position.y < map.height {
      if map.isTree(at: position) {
        treesCount += 1
      }
      position = .init(x: position.x + slope.x, y: position.y + slope.y)
    }

    return treesCount
  }
}

private extension String {
  var asMap: Year2020Day3.Map {
    var trees: Set<Point> = []
    let lines = split(separator: "\n")
    for (y, line) in lines.enumerated() {
      for (x, element) in line.enumerated() where element == "#" {
        trees.insert(Point(x: x, y: y))
      }
    }

    return .init(width: lines[0].count, height: lines.count, trees: trees)
  }
}

extension Year2020Day3 {
  fileprivate struct Map {
    let width: Int
    let height: Int
    let trees: Set<Point>

    func isTree(at position: Point) -> Bool {
      self.trees.contains(.init(x: position.x % self.width, y: position.y))
    }
  }

  var input: String {
    """
    .........#..##.##..............
    #...#.#..#.....................
    .#...#..#...................#..
    ........##..#...#..............
    .#.#.....#..#..##......#.......
    ....#..#...#..##........#..##..
    ...#....##........#.......#.#..
    ....#................#...###..#
    ...#...#.#..#....#.......####.#
    .....#...#..........#...#..#.#.
    ....#..#............#.#.#.#..#.
    ..#....#.###..#............#...
    .....#.............#.#.........
    .#.##............##.........#..
    ...##...#..#....#.##..#.....#..
    ..............#.#.........#.##.
    ...........#.....##....##......
    .......#............#...#......
    ............#.#....#....#..#..#
    ....#................####......
    ...#.........................##
    ..........#........#.#.........
    ....#.#....#...........#......#
    ..#.#..##......##..##..#..#.#..
    ...#.....##......#.#.#.........
    .........#.#....#...#.#.#......
    .......#.......###.#.......#...
    ..#............##..#.......#...
    ...#....#......#...#...#...#...
    ......#..#.#.....##......#.....
    ...........##...##...#....#.##.
    #.##..#.....##..#.#............
    .#.#.....##......#.##........#.
    ..#...#...#...#..........#...##
    ...##.........................#
    .....#......#.....##....#.....#
    ..#........#...................
    #......#..#.#..#..#.#..#...#...
    ...............#..........#....
    .....#...........#......#....#.
    ........#..#...............#...
    .........#...#.......#.#..#...#
    ..#..#......#.##..........#....
    .#...#....#.....#.............#
    .##.....#.........#......#..#..
    ........#..##.......#......#...
    .......#.....###......#..#.....
    .......#.#.......#.............
    ...#................##.#.......
    ..##..#...#.#...#.#..#.#.#.##..
    .......#.#............#...#....
    #...#.....#......#..........##.
    .#.......#......#.......#.#.#..
    .#.##.#.#...........#..........
    .......#.....#....#.#.##......#
    .###..#...#.............##.....
    ......#......#.................
    ##...#.#...##...#.#.....#....#.
    #.............#....##...#....#.
    #.#...#....#........#.###..##..
    ......#.........#......#.#.#.#.
    ..#.#.#.....#........#..#...#..
    #.##....#.#......#...........#.
    .#.#.####.........#..#.##....##
    ......##...............#......#
    .......#.........#........#.#..
    ....#....#..#.##.........#..#..
    .#..........#.##....#.#..#.....
    #..#.#............#..#....#.#.#
    ..................#..#.........
    ##..##.#....#.................#
    ..................#........#..#
    .....#.........#.......##......
    .....................#.#..#...#
    .....#.........#..........#.#..
    ...#.#..#..#.#.#.......#.......
    .....#.....#.#.........#.....##
    .............##....#....##.#...
    .#......#........##..#...###...
    ........#.......##.##.#......#.
    ..#....................#.##..#.
    ......#.......#..#....##.#.....
    ...#....#.......##...#.......#.
    .#.#..#.#..........##..........
    ....#.......##...........#.....
    ###....#.......#..#...#.....##.
    ...#......#.........#..#.#..#.#
    #.........#..##.#..............
    .#.....#..##.#..#..###.....##.#
    ..........#..#....##.......#...
    .#..#.#...#...##.#..#.##.#.....
    #....#...#........#......##....
    ..#.####....#.#........#....#..
    #......#............#.#........
    ...#..#.......##...........#...
    .........#..#.#..#.###.#...#..#
    ..#....##.......#.............#
    ............#..#......#........
    ........#......#..............#
    ..#.#.#...........#............
    ...........#......##.#.#.......
    .#..........#...........#..#...
    .....#...#..#.........##...#...
    .......#....##....#.#.........#
    ..#.#......#.......#...##.#....
    .....#..........#........#.....
    #.......#.......#............#.
    ..##.#.....#.##.#.#.#..#.......
    ..#...#.......#.###............
    .#...#..#....#...#...#..#....##
    .....#.....#...................
    .......................#......#
    ......#...##.........#...#..#..
    .....#..#.....#..............#.
    .#.##..#..#....................
    ....#..#...#....#.............#
    ..###..#...#......#.....#......
    ..#......###....#.....#.....###
    ...#.##..#...#.....#........#..
    .#.#...........##....#...#.##..
    .......#...##......#..#..#.....
    #.............#..#...##.#..#..#
    ..........#......#.......#.....
    ...............#.#.#....#...#..
    #.......#.#..#.....#........#..
    .#.#.#.......#..#.........##...
    ......#.....#.#....#...........
    ..#.....##.#........##.#......#
    ...###...#..#.........#........
    ....#...................#..#...
    .##........#...................
    ....#..#...........#.#.........
    .....#.......#...#....#.#......
    .........#...#.......#.#...#...
    .......#.#..#....#....#.......#
    ..#.............#..............
    .#...#..#.#.#..#............#..
    ...#.##.##..#..#...........##..
    ...........#...#..#.#........#.
    ....#...#.....#...#.#....#...#.
    .......#.#...##..#.............
    .......................#....#..
    ..#..#.....#...........#....#..
    .#..#...#.##........##....#....
    #.....##.#.#.......#.....#...#.
    .#....#.......................#
    #..##..###...#.........#.......
    ..##...#...#..........#....#...
    ......#..##......##.#.........#
    ................#........#..#..
    .....#.#..#.....#.......#..#...
    ..#..#.....#.......#..#..#...#.
    .#....#...#...#......##.....#..
    ....#........#...#......##....#
    ..#..........##......#......#..
    #.#.....#.....#.......#........
    ...#...#......#....##.#..#...##
    ...#....#...#.#...........##...
    #....##...#...#....#...........
    ...#.#..#...#..............##..
    #..#..........##.#.#.....#.....
    ..#...#.........#.#..........#.
    ....#.....#..........#.........
    ........................#......
    .#.....#.#...###...#....#......
    ....##....#....#..#.##........#
    ..#........#.........#.......#.
    .....#.#......#...#...#........
    ........#..#.....#....###....#.
    ...........#..#.#....#.#....##.
    .......#.....##.#............#.
    ...............#........##.##..
    .............#...##......#...#.
    #...##.#.......#......###.....#
    ..........#...#........#..#....
    ....#....................#...#.
    .#......#...#.......#....#.#...
    ....#.......................#..
    #...#...#...#.##....##.........
    ..........#.#...##.#...#.......
    ..#...............#....#..#...#
    #..#..#...#..#.........#...#...
    .....#..#..........#.##.#..##..
    ........#......##.....#........
    .#....#.#.........#...#..#.#...
    ....#..............##..........
    #...............#..............
    ..###.........#....##.........#
    .........#.#....##........#...#
    ....#.#..#......#...#..........
    ...#.#.....#....#..#....#.#..#.
    ............#..#.....#...##....
    ...........#....#.#.#...#......
    #...............#....###.......
    .........#.....##.#..#..#......
    ...#...##...###...............#
    .#......#.#.#.................#
    .........##..#............#....
    ..#..#.....#.....#.#...........
    .#......##............#.#....#.
    .#.##..##.##..#.........#.....#
    ...##.##......##.##......#.....
    ##.....#.#...#...#...#..#......
    ....................#......#...
    .....#.................#...###.
    ...........#..#.........#.#....
    ...#........#..#........#....#.
    #................#......###...#
    .............##.#.....#.#......
    ...#...#.##..#........##.......
    #..#.##...#....#.#.............
    .#.........#.#..#...........#..
    ....#...#.....#.#..........#...
    .#.#....###.......##.....#.##..
    .##....##......#......#.#....#.
    ..#...#.#........#...#..##.....
    ..............###..........##..
    #....#..##.....#.....#.....#...
    ...#...#....................#..
    .#....#.#.....#.#..#..##.......
    #...##..###......#.............
    ..........#.#....##.#........##
    ..#..#.....#...#....#.#.#......
    #.....#........#..##.#.........
    ....#.....#..........##......#.
    ......#..#.....#........#.....#
    .....#..#....#...........#.##..
    .#....................#....#..#
    ........#..#...........#.......
    #....#.#.......#........#.#..#.
    ........#.....#...#............
    ..#........#........#....#...#.
    .....##.......#..#..........#..
    ......#.#......###...#....##..#
    .#..#.............#.#..........
    #.....##.#.#.#.#.#.....#.....#.
    .#..#.....#.......#.#.....#....
    ###....##...#.#...#..#......###
    .#................#.....#.##...
    ....##....#.#........###.#.#...
    #.#....#........#.....#.......#
    ..........#..........#.##...#..
    ....#....#..##......#..#.......
    .....#..........#.##...........
    ##......#.#......#.##..........
    ##..........##.......##........
    ..#.....#....#.##..#..#..#.....
    ......###...#...........#...###
    #..#.............##............
    ...#.###.....#..#.........#.#..
    ......#...............#...#.#..
    .....#...##.#...#.....#.#..#...
    ..#..#.#....#.#................
    ...............##.....#........
    ......#.#.....#...#.........#..
    ........#..#...#.#...#......#..
    #...........#.......#...##...#.
    ........#.#...#..##..#.#...#...
    ..#....#...#......#..........##
    ..#..............##...##.#.....
    ...#....#..#....##.........#.#.
    .#.#....#..........#.......#...
    ...##....#.#....#....#.#...#...
    ..............#..##........#..#
    ..........#.#...##......#..#.#.
    #...##..#......................
    .......#........##.#.#.#.......
    .........##..#.#.......####....
    ..#.............#..#........##.
    ##..#..#...#....#.....#...#..#.
    ..#.#...#.#.....#..............
    ..#....#....#..##...#.#........
    ##.....#..#...#................
    #....#.....................#...
    ..............###.....#.#.#....
    ..#......##.#....#.#...##......
    #...#.#......#...#.#......#....
    ....#...................##.#...
    .........##......#.....#.####..
    ##..#........#.....#......##..#
    ...#..#...#...#.............#..
    #..#..#.#......###...#.........
    .......#.#..#........#....##..#
    ............#..##.....#.#.#....
    #..#.....#.....#....##........#
    ......#..........##............
    .....#...#...........#.........
    ...........#....#...#....#.#...
    ....#.........##.##.......#....
    ......#....#...........#.##...#
    .##.#.#..##...#.....##.#...#...
    .......#.#....#...#...#....#...
    .#...##.#.#.....#..#....#......
    .#....###..#.......#......#...#
    ..#.#.........#.........#.....#
    .......#.#.##..#.#.......##..#.
    .##............#.........#....#
    .#...##.###..#........##.#..#..
    ..#........#.#.....##..##.#....
    ...........#...........#.....#.
    .#...######..##...#.....#......
    .#.##.#.......#......#......#..
    .#.....#.....#........#........
    ...#..#...#.##...#...........#.
    .......#.....#.......#.........
    ............#...###...........#
    ...#.......#.......##....#..#..
    ##.......#....#....####........
    .......#.#......#..........#..#
    #.....##..#..#.....#....#...#..
    #............#........##.......
    .#.#...#.............#..##.....
    .#....#..#.#......#.##.......##
    ...................##...##..###
    ..#.....#...#................#.
    ..#...#....#...#.#.#...#.....#.
    .....#............#....#...#..#
    .#.....#....#..#......#.#.....#
    ............#.#.....####.##....
    ....#......###....#...#....#...
    #.....#..#.....#..#...#.......#
    ..#.#...#....#....##..#...##...
    .##..#..#..##....##...#........
    """
  }
}
