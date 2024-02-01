import XCTest

@testable import Collections

final class CollectionsStackTests: XCTestCase {
  func testStackPush() throws {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    XCTAssertEqual(stack.count, 3)
    XCTAssertEqual(stack.pop(), 3)
    XCTAssertEqual(stack.pop(), 2)
    XCTAssertEqual(stack.pop(), 1)
    XCTAssertEqual(stack.pop(), nil)
  }

  func testStackPop() throws {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    XCTAssertEqual(stack.count, 3)
    XCTAssertEqual(stack.pop(), 3)
    XCTAssertEqual(stack.pop(), 2)
    XCTAssertEqual(stack.pop(), 1)
    XCTAssertEqual(stack.pop(), nil)
  }

  func testStackIsEmpty() throws {
    var stack = Stack<Int>()
    XCTAssertEqual(stack.count, 0)
    stack.push(1)
    XCTAssertEqual(stack.count, 1)
    stack.push(2)
    XCTAssertEqual(stack.count, 2)
    let _ = stack.pop()
    XCTAssertEqual(stack.count, 1)
    let _ = stack.pop()
    XCTAssertEqual(stack.count, 0)
  }

  func testStackPeak() throws {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    XCTAssertEqual(stack.peek(), 3)
    let _ = stack.pop()
    XCTAssertEqual(stack.peek(), 2)
    let _ = stack.pop()
    XCTAssertEqual(stack.peek(), 1)
    let _ = stack.pop()
    XCTAssertEqual(stack.peek(), nil)
  }

  func testStackClear() throws {
    var stack = Stack<String>()
    stack.push("The")
    stack.push("quick")
    stack.push("brown")
    stack.push("fox")
    stack.push("jumps")

    XCTAssertEqual(stack.count, 5)

    stack.clear()
    XCTAssertEqual(stack.count, 0)
  }

}
