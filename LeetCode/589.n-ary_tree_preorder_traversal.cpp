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
    vector<int> preorder(Node* root) {
        vector<int> result;
        if (root == nullptr) {
            return result;
        }
        stack<Node*> nodes;
        nodes.push(root);
        while (!nodes.empty()) {
            Node* cur = nodes.top();
            nodes.pop();
            result.push_back(cur->val);
            for(int i=cur->children.size()-1;i>=0;i--)
                nodes.push(cur->children[i]);
        }
        return result;
    }
};