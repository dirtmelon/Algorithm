/*
// Definition for a Node.
class Node {
public:
    int val;
    vector<Node*> children;

    Node() {}

    Node(int _val, vector<Node*> _children) {
        val = _val;
        children = _children;
    }
};
*/
class Solution {
public:
    int maxDepth(Node* root) {
      return BFSDepth(root);
    }

    int DFSDepth(Node* node) {
      if (node == NULL) {
        return 0;
      }
      int depth = 0;
      for (Node *child : node->children) {
        depth = max(DFSDepth(child), depth);
      }
      return depth + 1;
    }

    int BFSDepth(Node* node) {
      if (node == NULL) {
        return 0;
      }
      queue<Node *> q;
      q.push(node);
      int depth = 1;
      while (!q.empty()) {
        depth += 1;
        queue<Node *> childrenQ;
        while (!q.empty()) {
          Node* curNode = q.pop();
          if (!curNode->children.empty()) {
            for (Node *child : curNode->children) {
              childrenQ.push(child);
            }
          }
        }
        q = childrenQ;
      }
      return depth;
    }
};