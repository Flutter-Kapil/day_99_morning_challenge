//  Good morning! Here's your coding interview problem for today.
//
//  Suppose an arithmetic expression is given as a binary tree. Each leaf is an
//  integer and each internal node is one of '+', '−', '∗', or '/'.
//
//  Given the root to such a tree, write a function to evaluate it.
//
//  For example, given the following tree:
//
//         *
//      /     \
//     +       +
//    /  \    / \
//   3    2  4   5
//  You should return 45, as it is (3 + 2) * (4 + 5).

class BinaryTree {
  String rootNode;
  BinaryTree leftBranch;
  BinaryTree rightBranch;
  BinaryTree({this.rootNode, this.leftBranch = null, this.rightBranch = null});
}

bool isNumeric(String str) {
  try {
    var value = double.parse(str);
    if (value is num)
      return true;
    else
      return false;
  } on FormatException {
    return false;
  }
//  finally {
//    return true;
//  }
}

String calculator(String a, String b, String op) {
  double x = double.parse(a);
  double y = double.parse(b);
  return operations[op](x, y).toString();
  if (op == "+") return (x + y).toString();
  if (op == "-") return (x - y).toString();
  if (op == "*") return (x * y).toString();
  if (op == "/") return (x / y).toString();
}

Map<String, Function> operations = {
  '+': (double x, double y) => x + y,
  '-': (double x, double y) {
    if (x == 0 && y == 0) throw Error;
    return x - y;
  },
  '*': (double x, double y) => x * y,
  '/': (double x, double y) => x / y,
};
String evaluateTree(BinaryTree root) {
  String left;
  String right;

  if (isNumeric(root.rootNode)) return root.rootNode;

  //check if left node is numeric or not
  if (isNumeric(root.leftBranch.rootNode))
    left = root.leftBranch.rootNode;
  else
    left = evaluateTree(root.leftBranch);
  if (isNumeric(root.rightBranch.rootNode))
    right = root.rightBranch.rootNode;
  else
    right = evaluateTree(root.rightBranch);

  String temp;
  try {
    temp = calculator(left, right, root.rootNode);
  } catch (e) {
//    temp="Wrong Pinpu2";
//    print(temp);
    return "Wrong Input";
  }

  if (temp is num)
    return temp;
  else
    return "Wrong Input";
}

void main() {
  BinaryTree b = BinaryTree(
    rootNode: "0",
  );

  BinaryTree d = BinaryTree(
    rootNode: "0",
  );
  BinaryTree c = BinaryTree(rootNode: "0", leftBranch: d);
  BinaryTree a = BinaryTree(rootNode: "+", rightBranch: b, leftBranch: c);
//  print(evaluateTree(a));

  BinaryTree d2 = BinaryTree(
    rootNode: "2",
  );
  BinaryTree e2 = BinaryTree(rootNode: "/", rightBranch: b, leftBranch: c);
  BinaryTree f2 = BinaryTree(
    rootNode: "4",
  );
  BinaryTree g2 = BinaryTree(
    rootNode: "2",
  );
  BinaryTree b2 = BinaryTree(rootNode: "/", leftBranch: d2, rightBranch: e2);
  BinaryTree c2 = BinaryTree(rootNode: "*", leftBranch: f2, rightBranch: g2);
  BinaryTree a2 = BinaryTree(rootNode: "+", rightBranch: b2, leftBranch: c2);
  print(evaluateTree(a2));

//  e2=BinaryTree(rootNode:"+",rightBranch: b,leftBranch: c );
//  print(evaluateTree(a2));
//  print(0/0);
}
