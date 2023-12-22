import 'node.dart';

void main() {
  LinkedList linkedList = new LinkedList();
  linkedList.pushAtEnd(1);
  linkedList.pushAtEnd(2);
  linkedList.pushAtEnd(3);
  linkedList.pushAtEnd(3);
  linkedList.printListReversed();

  print(linkedList.getMiddle()); //gets the middleNode instance

  linkedList.reverseList();
  linkedList.printListReversed();
  linkedList.removeAllOccurrences(3);
  linkedList.printListReversed();
}

class LinkedList {
  Node? head;
  int size = 0;
  Node? tail;


  void pushAtEnd(dynamic value) {
    if (value != null) {
      Node newNode = Node(value);

      if (head == null) {
        head = newNode;
        tail = newNode;
      } else {
        tail!.next = newNode;
        tail = newNode;
      }
      size++;
    }
  }

  void popFromFirst() {
    if (size == 0) {
      print("You cannot pop from an empty linked list");
    } else {
      head = head!.next;
      if (head == tail) {
        tail = null;
      }
      size--;
    }
  }

  void popFromEnd() {
    if (size == 0) {
      print("You cannot pop from an empty linked list");
    } else {
      if (head!.next == null) {
        head = null;
        tail = null;
      } else {
        Node currentNode = head!;
        while (currentNode.next!.next != null) {
          currentNode = currentNode.next!;
        }
        currentNode.next = null;
        tail = currentNode;
      }
      size--;
    }
  }

  dynamic getMiddle() {
    Node? currentNode = head;
    if (currentNode != null) {
      for (var i = 0; i < getSize() / 2; i++) {
        currentNode = currentNode?.next;
      }

      return currentNode;
    }
    return null;
  }

  void printListReversed() {
    printListReversedHelper(head);
  }

  void printListReversedHelper(Node? currentNode) {
    if (currentNode != null) {
      printListReversedHelper(currentNode.next);
      print(currentNode.value);
    }
  }

  void reverseList() {
    Node? prev = null;
    Node? current = head;
    Node? nextNode;

    while (current != null) {
      nextNode = current.next;
      current.next = prev;
      prev = current;
      current = nextNode;
    }

    head = prev;
  }

  void removeAllOccurrences(int value) {
    if (head == null) {
      return;
    }

    while (head != null && head?.value == value) {
      head = head?.next;
      if (head == null) {
        tail = null;
      }
      size--;
    }

    if (head == null) {
      return;
    }

    Node? current = head;
    Node? previous = null;

    while (current != null) {
      if (current.value == value) {
        if (previous != null) {
          previous.next = current.next;
          if (current.next == null) {
            tail = previous;
          }
          size--;
        } else {
          head = current.next;
          if (head == null) {
            tail = null;
          }
          size--;
        }
      } else {
        previous = current;
      }
      current = current.next;
    }
  }

  int getSize() {
    return size;
  }
}
