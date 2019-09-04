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
    ListNode *detectCycle(ListNode *head) {
        if (head == nullptr) {
            return nullptr;
        }
        ListNode *fast, *slow;
        slow = head;
        fast = head;
        bool is_cycle = false;
        while (fast && fast->next) {
            slow = slow->next;
            fast = fast->next->next;
            if (slow == fast) {
                is_cycle = true;
                break;
            }
        }
        if (!is_cycle) {
            return nullptr;
        }
        
        ListNode *current = head;
        while (current != slow) {
            slow = slow->next;
            current = current->next;
        }
        return current;
    }
};