void main() {
  Stack stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  // Reverse a List
  print(stack.getReversed());

  // Balance the Parentheses
  String input = "({[]})";
  // String input = '(';
  print(checkForBalancedParentheses(input));
}

// this code checks for Balanced Parentheses with a condintion that a Parenthesy should be closed as the way as Parentheses in programming
bool checkForBalancedParentheses(String input) {
  // create a stack to store the parentheses
  Stack parenthesesStack = new Stack();
  for (var i = 0; i < input.length; i++) {
    // if the input is an opening store it in the stack not L [ and { are extras :)
    if (input[i] == '(' || input[i] == '{' || input[i] == '[') {
      parenthesesStack.push(input[i]);
    } else if (input[i] == ')' || input[i] == '}' || input[i] == ']') {
      // if the input is a closing check if it matches the last opening if so delete the opening else return false
      if (parenthesesStack.getSize() == 0 &&
          parenthesesStack.getLast() != input[i]) {
        return false;
      } else {
        parenthesesStack.pop();
      }
    }
  }
  return parenthesesStack.getSize() == 0;
}

class Stack {
  List<dynamic> _list = [];
  int length = 0;
  void push(dynamic param) {
    _list.add(param);
    length++;
  }

  void pop() {
    if (length != 0) {
      _list.removeLast();
      length--;
    }
  }

  dynamic getLast() {
    return length > 0 ? _list[length - 1] : null;
  }

  int getSize() {
    return length;
  }

  List<dynamic> getStack() {
    return _list.sublist(0, length);
  }

  List<dynamic> getReversed() {
    List<dynamic> result = [];
    for (int i = length - 1; i >= 0; i--) {
      result.add(_list[i]);
    }
    return result;
  }
}
