class Node<T> {
    var value: T
    var next: Node<T>?
    var previous: Node<T>?
    
    init(value: T, next: Node<T>? = nil, previous: Node<T>? = nil) {
        self.value = value
        self.next = next
        self.previous = previous
    }
}

struct LinkedList<T: Equatable> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    var isEmpty: Bool { head == nil }

    mutating func add(node: Node<T>) {
        if let last = tail {
            last.next = node
            node.previous = last
            tail = node
        } else {
            head = node
            tail = node
        }
    }
    
    mutating func append(_ value: T) {
        let node = Node(value: value)
        add(node: node)
    }
    
    mutating func prepend(_ value: T) {
        let node = Node(value: value)
        if let first = head {
            node.next = first
            first.previous = node
            head = node
        } else {
            head = node
            tail = node
        }
    }
    
    mutating func insertAfter(node: Node<T>, nodeAfterValue: Node<T>) {
        guard var currentNode = head else { return }
        
        while currentNode.value != nodeAfterValue.value {
            guard let nextNode = currentNode.next else {
                print("error, no node with value \(nodeAfterValue.value)")
                return
            }
            currentNode = nextNode
        }
        
        if let currentNodeNext = currentNode.next {
            currentNode.next = node
            node.previous = currentNode
            node.next = currentNodeNext
            currentNodeNext.previous = node
        } else {
            currentNode.next = node
            node.previous = currentNode
            tail = node
        }
    }
    
    mutating func delete(nodeValue: T) {
        guard var currentNode = head else {
            print("error, empty list")
            return
        }
        
        if currentNode.value == nodeValue {
            if let nextNode = currentNode.next {
                head = nextNode
                nextNode.previous = nil
            } else {
                head = nil
                tail = nil
            }
            return
        }
        
        while currentNode.value != nodeValue {
            guard let nextNode = currentNode.next else {
                print("error, no node for value \(nodeValue)")
                return
            }
            currentNode = nextNode
        }
        
        let before = currentNode.previous
        let after = currentNode.next
        
        before?.next = after
        after?.previous = before
        
        if after == nil {
            tail = before
        }
    }

    func contains(_ value: T) -> Bool {
        var currentNode = head
        while let node = currentNode {
            if node.value == value { return true }
            currentNode = node.next
        }
        return false
    }
    
    var count: Int {
        var currentNode = head
        var counter = 0
        while let node = currentNode {
            counter += 1
            currentNode = node.next
        }
        return counter
    }
    
    func printListForward() {
        var currentNode = head
        while let node = currentNode {
            print(node.value)
            currentNode = node.next
        }
    }
    
    func printListBackward() {
        var currentNode = tail
        while let node = currentNode {
            print(node.value)
            currentNode = node.previous
        }
    }
}

// Example usage
var list = LinkedList<Int>()
list.append(10)
list.append(20)
list.append(30)

list.insertAfter(node: Node(value: 15), nodeAfterValue: Node(value: 10))
list.insertAfter(node: Node(value: 40), nodeAfterValue: Node(value: 30)) // updates tail properly

list.delete(nodeValue: 15)

print("Forward:")
list.printListForward()

print("Backward:")
list.printListBackward()

print("Contains 20:", list.contains(20))
print("Contains 99:", list.contains(99))
print("Count:", list.count)
