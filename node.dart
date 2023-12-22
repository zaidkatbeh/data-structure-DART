export 'node.dart' show Node;
class Node {
  dynamic value;
  Node? next;

  Node(dynamic value) {
    this.value = value;
    this.next = null;
  }
}