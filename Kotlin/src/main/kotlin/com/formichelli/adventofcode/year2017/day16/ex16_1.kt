package com.formichelli.adventofcode.year2017.day16

import com.formichelli.adventofcode.utils.Utils

/*
You come upon a very unusual sight; a group of programs here appear to be dancing.
There are sixteen programs in total, named a through p. They start by standing in a line: a stands in position 0, b stands in position 1, and so on until p, which stands in position 15.
The programs' dance consists of a sequence of dance moves:
Spin, written sX, makes X programs move from the end to the front, but maintain their order otherwise. (For example, s3 on abcde produces cdeab).
Exchange, written xA/B, makes the programs at positions A and B swap places.
Partner, written pA/B, makes the programs named A and B swap places.
For example, with only five programs standing in a line (abcde), they could do the following dance:
s1, a spin of size 1: eabcd.
x3/4, swapping the last two programs: eabdc.
pe/b, swapping programs e and b: baedc.
After finishing their dance, the programs end up in order baedc.
You watch the dance for a while and record their dance moves (your puzzle input). In what order are the programs standing after their dance?
*/
fun main(args: Array<String>) {
    val input = Utils.getSingleLineInput().split(",")
    var programs = "abcdefghijklmnop"

    input.forEach {
        programs = programs.dance(it)
    }

    println(programs)
}

private fun String.dance(move: String) = when (move[0]) {
    's' -> this.spin(move.substring(1).toInt())
    'x' -> this.exchange(move.substring(1).split("/").map { it.toInt() })
    'p' -> this.partner(move.substring(1).split("/").map { it[0] })
    else -> throw IllegalArgumentException("Invalid move: " + move)
}

private fun String.spin(spinSize: Int): String {
    val splitAt = this.length - spinSize
    return this.substring(splitAt) + this.substring(0 until splitAt)
}

private fun String.exchange(indexes: List<Int>): String {
    return this.replaceRange(indexes[0], indexes[0] + 1, this[indexes[1]].toString()).replaceRange(indexes[1], indexes[1] + 1, this[indexes[0]].toString())
}

private fun String.partner(partners: List<Char>) = this.exchange(listOf(this.indexOf(partners[0]), this.indexOf(partners[1])))
