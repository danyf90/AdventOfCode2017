//
//  Year2019Day18Tests.swift
//  Tests
//
//  Created by Daniele Formichelli on 18/12/2019.
//  Copyright © 2019 Daniele Formichelli. All rights reserved.
//

@testable import AdventOfCode2019
import XCTest

class Year2019Day18Tests: XCTestCase {
  func testPart1() {
    XCTAssertEqual(Year2019Day18().part1(Self.input).debugDescription, "4118")
  }

  func testPart2() {
    XCTAssertEqual(Year2019Day18().part2(Self.input).debugDescription, "1828")
  }

  static var input: String {
    """
    #################################################################################
    #.#..a....#...#..........y..#.#.........#.I...#...#.....#.............#.......#.#
    #.#.###.###.#.#P#########.#.#S#.#######.#.###.#.#.###.#.###.#########.#.#####.#.#
    #.#...#.#...#...#.......#.#.#.#...#z....#...#.#.#.#...#...#.#...#.....#.#.......#
    #.###.#.#.#######.#######.#.#.###.#.#####.#.#.#.#.#.#####.#.#.#.#.#####.#######.#
    #q..#.#...#.#.....#.....#.#.#.....#.....#.#.#.#.#.#.....#..c#.#.#.......#.....#.#
    #.###.#####.#.#.#.#.###.#.#.###########.#.#.#.#.#.#####.#####.#.#########.###.#.#
    #.#...#.....#.#.#.#...#...#......b......#.#.#...#...#...#...#.#.....#.....#.#.#.#
    #.#.###.#####.#.#####.#####.#######.#####.#.#######.#.#.#.#.#.#####.#.#####.#.###
    #.#...#.......#.....#.#.....#.....#.#l..#.#...#.D.....#.#.#...#...#...#.....#...#
    #.###.###.#######.#.#.#######.###.###.#.#.###.###.#####.#.#######.#####.###.###.#
    #...#...#...#...#.#.#.......#...#.....#.#...#...#.#...#n#.#.......#....r..#.#...#
    #.#.###.###.#.#.###.#######.###.#######.#######.#.#.#.#.#.#.#####.#.#######.#.###
    #.#...#...#.#.#...........#...#.#.#...#.#.......#.#.#.#.#...#...#.#.....#...#...#
    ###.#####.###.###########.#.###.#.#.#.#.#.###.#####.#.#.#####.###.#######.#.###A#
    #...#.....#...#...........#.#...#.#v#...#.#...#.....#.#...#...............#.#...#
    #.###.#####.###.#####.#####.#.###.#.#####.#####.#####.#####.#################.###
    #.....#.....#...#.G.#.#...#.......#.#...#...#.....#...#.....#.........#.....#.#.#
    #.#####.#####.###.#.###.#.#######.#.###.#.#.#.#####.#.#.#####.#######.#.###.#.#.#
    #.R...#.#.....#...#.#x..#...F.#.#.#...#.#.#...#...#.#.#.#...#.#.#...#.#...#...#.#
    #####.#.#######.###.#.#######.#.#.###.#.#.#####.#.#.#.#.#.#.#.#.#.#.#.###.#####.#
    #.#...#.........#...#.#.....#.#...#...#.#.#...#.#...#.#...#.#.#...#.#.....#...#.#
    #.#.#########.###.#.###.###.#.#####.###.#.#.#.#.###.#######.#######.#######.#.#.#
    #...#.......#.#...#.....#.#.#.......#...#.#.#.#...#.#.....#.......#.#.....T.#...#
    #.#####.###.#.#.#########.#.#########.###.#.#.###.#.#.###.#######.#.#.#.#######.#
    #...M.#.#...#.#.....#.....#...#.........#.#.#.....#.#.#.#.....#.#.#...#.#.....#.#
    #####.#.###.#.#####.###.#.###.#####.###.#.#.#########.#.###.#.#.#.#.###.#.###.#.#
    #...#.#...#.#.....#...#.#...#.....#...#.#.#.......#...#.#...#...#.#.#...#...#.#.#
    #.###.###.#.#########.#.#########.#####.#.#######.#.###.#.#######.#.#.#####.#.#.#
    #...#.....#...........#.....#...#.......#.....#.#...#...#...#.....#.#.......#.#.#
    #K#.###################.###.#.#.#######.#####.#.#######.###.#.#####.#########.#.#
    #.#...........#.....#...#.#.#.#.......#.#.#...#...#.......#...#.............#.#.#
    #.#.###.#######.#.###.###.#.#.#####.###.#.#.###.###.#.###.#####.#############.###
    #.#.#...#.......#.....#...#...#...#...#.#...#.......#...#.....#.....#.......#...#
    #.#.#.###.#############.#.#####.#.###.#.#.#########.###.#######.#####.#####.###.#
    #.#.#...#.....#...H.....#.......#...#...#.#.......#...#.....#...#.....#...#...#.#
    #.#.###.#####.#######.#########.###.#####.#.#####.###.#####.#.###.#####.#.###.#.#
    #.#.#...#.....#.....#.......#...#...#...#...#.....#.......#.....#.....#.#...#.#.#
    #.#.#####.#####.###.#########.###.#####.#####.#######################.#.#.###.#.#
    #.#..........u..#.............#o......................................#.#....k..#
    #######################################.@.#######################################
    #.#.......#.............#.......#...................#.....#....h......#.......#.#
    #.#.#####.#.#######.#####.#####.#.#.###.#.###.#####.###O#.###.#######.#.#####.#.#
    #.#.....#...#.....#.#.....#.....#.#.#.#.#...#.#.........#.....#...#...#...#.#...#
    #.#####.#####.###.#.#.#####.#####.#.#.#.###.#.#################.#.#.###.#.#.###.#
    #.E...#.#.#..w#...#.#.#.#.Z.#...#.#.#...#...#.#...#.......#.#.U.#...#...#.#...#.#
    #.###.#.#.#.###.###.#.#.#.###.#.#.#.#####.###.#.#.#.#####.#.#.###########.#.#.#.#
    #.#...#.#...#...#...#.#.#...#.#.#.#.....#...#...#...#...#.#.#.....#.....#.#.#.#.#
    #.#.###.#.###.#.#.###.#.###.#.#.#####.#.###.#########.#.#.#.#####.#.###.#.#.#.#.#
    #.#...#.#...#.#.#...#.#...#s..#.....#.#.#.#.#.........#.#.#.#...#...#.#...#.#.#.#
    #####.#.###.#.#####.#.#.#.#########.#.#.#.#.#.#####.#####.#.#.#.#####.#####.#.#.#
    #.....#.#...#.....#...#.#.......#...#.#.#.#.#.#.....#.....#...#.......#.....#...#
    #.#####.#########.#####.#######.#.#####.#.#.###.###.#.#####.###.#######.#########
    #.#.....#...#...#.....#.#...#...#.#.....#.#.#...#...#.#.#...#.#.....#...#...#..m#
    #.#.#####.#.#.#.#.###.#.#.#.#####.#.###.#.#.#.###.###.#.#.###.#####.#.###.#.###.#
    #.#.#.....#.#.#...#.#.#...#...#...#...#.#.#...#.....#.#...#.......#...#..e#...#.#
    #.#.#####.#.#.#####.#.###.###.#.###.#.###.###.#######.#.#######.#.#####.#####.#.#
    #.#...#...#...#.....#...#.#...#.L.#.#...#.#...#...#...#.....#...#...#...#...#...#
    #.###.#.#######.###.###.###.#.###.#.###.#.#.###.#.#.#######.#.#####J#.###.#.###.#
    #...#...#...#...#.#.......#.#.#...#...#.#.....#.#...#.#.......#.......#...#.#...#
    #.#.#######.#.###.#######.#.###.###.###.#.#####.#####.#.###############.#.###.###
    #.#.#.......#.#.....#...#...#...#...#...#...#...#.......#...#.#.....#.#.#.....#.#
    #.###.#.#####.#.###.###.#####.###.###.#.#####.###.#########.#.#.###.#.#.#######.#
    #...#.#.......#...#...#.#...#.#...#.#.#.#.....#.#...#.....#.#...#.#.#.#.....#...#
    #.#.#.###########.#.#.#X#.#.#.###.#.#.###.#####.###.#.#.#.#.#####.#.#.#####.###Q#
    #j#.#...#.........#.#.#...#.#.V.#...#...#.#.......#.#.#.#...#.....#.#.....#.#...#
    ###.###.#.#########.#######.#.#.#######.#.###.#.###.#.#.###.#.#.###.#.#.###.#.#.#
    #...#...#...#.....#d....#...#.#.#.......#...#.#.#...#.#...#...#.#...#.#.....#.#.#
    #.#.#.#####.###.#.###.#.#.#####.#.#####.###.###.#.#######.#####.#.###W#######.#.#
    #.#.#.#.......#.#...#.#.#.#..f..#...#.#.#...#...#...#...#...#...#.#.#.....#...#.#
    #.#.#.#######.#.#.#.#.###.###.###.#.#.#.#.###.#####.#.#.###.#.###.#.#####.#.###.#
    #.#.#.....C.#.#.#.#.#...#.....#...#.#.#.#.#...........#...#.#.#...#.....#...#.#.#
    #.#########.#.###.#.###.#######.###.#.#.#.#####.#########.#.###.###.#.#######.#.#
    #...#.....#.#.....#...#.....#.....#.#...#.....#.#.......#...#...#...#.........#.#
    #.#.#.###.#.###########.###.#######.###.#.###.###.#####.#####.###.#########.#.#.#
    #.#.....#.#.......#...#...#t#.....#...#.#...#.....#...#.....#...#.Y.#.#.....#.#.#
    #.#######.#######.#.#.###.#.#.###.###.#.###.#######.#######.###.###.#.#.#######.#
    #..g#.#...#.......#.#.#...#...#...#...#.#.#.#.....#.......#...#.#.#.#.#....p..#.#
    ###.#.#N###.#######.#.#.#######.###.###.#.#.#.###.#######.###.#.#.#.#.#######.#.#
    #.....#.............#...#........i..#...#.....#.............#...#.........B.#...#
    #################################################################################
    """
  }
}
