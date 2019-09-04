/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution
{
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB)
    {
        int lengthA = getListLength(headA);
        int lengthB = getListLength(headB);

        if (lengthB > lengthA)
        {
            std::swap(headA, headB);
        }
        int distance = abs(lengthA - lengthB);
        ListNode *nodeA = headA;
        ListNode *nodeB = headB;
        while (distance != 0)
        {
            nodeA = nodeA->next;
            distance -= 1;
        }

        while (nodeA != nullptr && nodeB != nullptr)
        {
            if (nodeA == nodeB)
            {
                return nodeA;
            }
            nodeA = nodeA->next;
            nodeB = nodeB->next;
        }
        return nullptr;
    }

    int getListLength(ListNode *head)
    {
        if (head == nullptr)
        {
            return 0;
        }
        int length = 0;
        ListNode *node = head;
        while (node != nullptr)
        {
            node = node->next;
            length += 1;
        }
        return length;
    }
};