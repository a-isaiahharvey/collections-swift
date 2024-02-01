internal final class Node<T> {
  internal var data: T
  internal var next: Node<T>?

  internal init(data: T, next: Node<T>?) {
    self.data = data
    self.next = next
  }
}

/// A stack data structure implemented using a linked list.
///
/// # Examples
///
/// ```
/// import Collections
///
/// // Creates and initializes a new Stack.
/// var stack = Stack<String>()
/// stack.push("Hello")
/// stack.push("World")
/// stack.push("!")
///
/// print("stack")
/// print("\tLength: \(stack.len())")
/// ```
public struct Stack<T> {

  internal var top: Node<T>?
  internal var len: Int

  /// Checks if the stack is empty.
  ///
  /// Returns `true` if the stack is empty, `false` otherwise.
  public var empty: Bool {
    self.len == 0
  }

  /// Returns the length of the stack.
  ///
  /// # Returns
  ///
  /// The number of elements in the stack.
  public var count: Int {
    self.len
  }

  /// Creates an empty stack.
  public init() {
    self.top = nil
    self.len = 0
  }
}

extension Stack {
  /// Pushes a value onto the top of the stack.
  ///
  /// # Parameters
  ///
  /// * `data` - The value to be pushed onto the stack.
  public mutating func push(_ data: consuming T) {
    let node = Node(data: data, next: self.top)
    self.top = node
    self.len += 1
  }

  /// Removes and returns the top element from the stack.
  ///
  /// Returns `nil` if the stack is empty.
  public mutating func pop() -> T? {
    guard let top = self.top else {
      return nil
    }

    self.top = top.next
    self.len -= 1
    return top.data
  }

  /// Returns a reference to the top element of the stack.
  ///
  /// Returns `nil` if the stack is empty.
  public func peek() -> T? {
    self.top.map({ node in node.data })
  }

  /// Removes all elements from the stack.
  public mutating func clear() {
    for _ in 0..<self.len {
      let _ = self.pop()
    }
  }
}

extension Stack {
  subscript(index: Int) -> T {
    get {
      var current = self.top

      for i in (0..<self.count).reversed() {
        if let node = current {
          if i == index {
            return node.data
          }

          current = node.next
        } else {
          break
        }
      }

      fatalError("Index out of bounds")
    }
  }
}
