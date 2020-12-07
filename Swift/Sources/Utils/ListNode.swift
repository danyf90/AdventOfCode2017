//
//  ListNode.swift
//  AdventOfCode2019
//
//  Created by Daniele Formichelli on 30/11/2019.
//  Copyright © 2019 Daniele Formichelli. All rights reserved.
//

import Foundation

public class ListNode<T> {
  public let value: T
  public var next: ListNode<T>?
  public var prev: ListNode<T>?

  public init(value: T, next: ListNode<T>? = nil, prev: ListNode<T>? = nil) {
    self.value = value
    self.next = next
    self.prev = prev
  }
}

public extension ListNode {
  var length: Int {
    var currentLength = 0
    var current: ListNode? = self
    while current != nil {
      current = current?.next
      currentLength += 1
    }

    return currentLength
  }

  var array: [T] {
    var array: [T] = []
    var current: ListNode? = self
    while current != nil {
      array.append(current!.value)
      current = current?.next
    }
    return array
  }
}

public extension Array {
  var toList: ListNode<Element>? {
    guard !isEmpty else { return nil }

    let head = ListNode<Element>(value: self[0])
    var tail = head
    for element in dropFirst() {
      let next = ListNode<Element>(value: element)
      tail.next = next
      tail = next
    }
    return head
  }
}
