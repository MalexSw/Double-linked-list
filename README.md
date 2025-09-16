# Doubly Linked List in Swift  

This repository contains an implementation of a **generic doubly linked list** in Swift.  
It demonstrates how to manage dynamic data structures with nodes linked **both forward and backward**,  
allowing efficient traversal and updates from either end.  

---

## Features  

- Generic `Node<T>` class with:
  - `value`
  - `next` reference
  - `previous` reference  

- Generic `LinkedList<T>` struct with:
  - `head` and `tail` references for O(1) access to both ends  
  - `isEmpty` property  
  - Core operations:
    - `add(node:)` → append an existing node  
    - `append(_:)` → append by value  
    - `prepend(_:)` → add to the beginning  
    - `insertAfter(node:nodeAfterValue:)` → insert after a given node  
    - `delete(nodeValue:)` → delete a node by value  
  - Utility methods:
    - `contains(_:)` → check if a value exists  
    - `count` → number of nodes  
    - `printListForward()` → traverse from head to tail  
    - `printListBackward()` → traverse from tail to head  

---

## Code Analysis  

### Data Structure  
- `Node<T>` is implemented as a **class** for reference semantics (needed for linked nodes).  
- `LinkedList<T>` is implemented as a **struct** but internally manages reference-based nodes.  
- Both `head` and `tail` are maintained for efficient operations at both ends.  

### Edge Cases Handled  
- Deletion in an empty list.  
- Deletion of the head node.  
- Deletion of the tail node.  
- Insertion after the tail updates `tail` correctly.  
- Duplicate values: `delete` and `insertAfter` operate on the **first match**.  

### Convenience Methods  
- `append(_:)` and `prepend(_:)` allow easy insertion without creating nodes manually.  
- `contains(_:)` checks if a value is present.  
- `count` provides the total number of nodes.  

---

# Summary
This project demonstrates a doubly linked list in Swift with safe handling of head/tail operations,
convenience methods, and forward/backward traversal.
It is suitable for learning how pointer-based data structures work in Swift,
and can serve as a foundation for more advanced data structures.
