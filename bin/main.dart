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
  BinaryTree({this.rootNode, this.leftBranch=null, this.rightBranch = null});

}
bool isNumeric(String str) {
  try{
    var value = double.parse(str);
  } on FormatException {
    return false;
  } finally {
    return true;
  }
}
String calculator(String a, String b,String op){
  double x=double.parse(a);
  double y=double.parse(b);
  if(op=="+")
      return (x+y).toString();
  if(op=="-")
    return (x-y).toString();
  if(op=="*")
    return (x*y).toString();
  if(op=="/")
    return (x/y).toString();
}

String evaluateTree(BinaryTree root) {
  if(root.leftBranch==null && root.rightBranch==null)
    //if both are null that means it must be an integer or double
    return double.parse(root.rootNode).toString();
  else
    return calculator(evaluateTree(root.rightBranch), evaluateTree(root.leftBranch), root.rootNode);

}

void main() {
  BinaryTree b= BinaryTree(rootNode:"2",);

  BinaryTree d= BinaryTree(rootNode:"3",);
  BinaryTree c= BinaryTree(rootNode:"3",leftBranch: d);
  BinaryTree a= BinaryTree(rootNode:"+",rightBranch: b,leftBranch: c );
  print(evaluateTree(a));
}
