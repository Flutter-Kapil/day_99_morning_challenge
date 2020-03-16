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
  var rootNode;
  var leftBranch;
  var rightBranch;
  BinaryTree({this.rootNode = null, this.leftBranch, this.rightBranch = null});

  int result() {
    if (rootNode == '+') return rightBranch + leftBranch;
    if (rootNode == '*') return leftBranch * rightBranch;
    if (rootNode == '/') return int.parse((leftBranch / rightBranch).toString());
    if (rootNode == '-') return leftBranch-rightBranch;
  }
}

int evaluateBt(BinaryTree root) {
  int res;
  if(root.leftBranch==null && root.rightBranch==null)
    return root.rootNode;
  if (root.leftBranch is int && root.leftBranch is int)
    return root.result();
  return root.result();
}

void main() {
  BinaryTree b = BinaryTree(rootNode: '+', leftBranch: 2, rightBranch: 3);
  BinaryTree a = BinaryTree(rootNode: '+', leftBranch: 2, rightBranch: b);
  print(evaluateBt(a));
}
